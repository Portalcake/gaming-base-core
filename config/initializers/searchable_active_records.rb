class ActiveRecord::Base
  def self.searchable
    include Searchable
  end
end

module Searchable
  def self.included(base)
    base.class_eval {

      thread_local_accessor :searchable_attributes, :default => Hash.new({})

      def self.search_for(name, opts, &condition)
        return unless condition

        searchable_attributes[name] = opts.merge({
          :key => name,
          :condition => condition
        })
      end

      def self.searchables
        searchable_attributes.values
      end

      # Named scopes
      scope :search, lambda {|q|
        next unless q.kind_of?(Hash)

        base = self.scoped
        q.each do |key, search|
          key = key.to_sym
          next if search.empty? || !searchable_attributes.has_key?(key)
          base = searchable_attributes[key][:condition].call(base, search)
        end
        base
      }
    }
  end
end