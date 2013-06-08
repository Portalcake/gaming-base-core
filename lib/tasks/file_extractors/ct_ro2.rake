# encoding: utf-8

# Fileinfo *.ct
# 
# [64] Header "RO2!2012-11-27 14:17:32\x00*"
# [4, uint] amount_columns
# each amount_columns
#   [4, uint] column_name_length
#   [2*column_name_length, string] column_name
# 
# [4, uint] amount_columns (again)
# each amount_columns
#   [4, uint] column_type of column i
#   
# [4, uint] amount_rows
# 
# 
# 
# ** column_types **
#    
#  2 == [1, int]
#     > VoiceSelect, custom_Skin, race_desc, CardMaterial
#     > Custom_Eye, Custom_ZoomInfo, Custom_Weave_Color_Info
#     > CardCompose, Premium_Effect_Name
#  3 == [2, uint]
#     > Max_Status, Standard_Stat
#  4 == [2, uint]
#     > MultiType, ItemMultiType, ItemTransform, JobInfo
#     > ComposeInfo, RidingInfo, Monster, Map_List, Quest_Info
#  5 == [4, int]
#     > BankCondition, Standard_Stat, itemcategory
#  6 == [4, int]
#     > VoiceSelect, ItemArmor*, MultiType, CardMaterial
#     > Custom_Eye, Craft_PositionGroup, Custom_Weave_Color_Info
#     > ItemTransform, QuestEffectList, CardCompose,
#     > Premium_Effect_Name
#  7 == 4*[1, uint] (color)
#     > custom_Skin
#  8 == [4, int] string_length
#       [2*string_length, string]
#     > race_desc, BanItem, QuestEffectList
#  9 == [4, float]
#     > Custom_ZoomInfo, JobInfo, RidingInfo, Monster, Map_List
# 11 == [8, float]
#     > BaseExpTable, ItemInfo
# 12 == [1, uint]
#     > NPCInfo

load "#{File.dirname(__FILE__)}/file_extractor.rake"

class FileExtractor_ct < FileExtractor

  private
  def analyze
    header = @file.read(64)
    log "Header : #{header}"

    hcolumns = @file.read(4).unpack("l").first
    log "Columns: #{hcolumns}"
    log "----------------"

    @header = []
    1.upto hcolumns do |cindex|
      clength = @file.read(4).unpack("l").first
      @header << @file.read(2*clength).encode('UTF-8', 'UTF-16LE')
    end

    rcolumns = @file.read(4).unpack("l").first
    columnwidths = []
    1.upto rcolumns do |cindex|
      columnwidths << @file.read(4).unpack("l").first
    end

    0.upto(hcolumns-1) do |i|
      log "[#{columnwidths[i]}] #{@header[i]}"
    end

    log "---- @file ----"
    rows = @file.read(4).unpack("l").first
    log "Rows: #{rows}"

    1.upto(rows) do |rindex|
      log "------------ Row: #{rindex}/#{rows} -----------"
      row = []
      columnwidths.each_with_index do |column_type, icolumn|
        value = case column_type
        when 2, 12
          @file.read(1).unpack("C").first
        when 3,4
          @file.read(2).unpack("s").first
        when 5, 6
          @file.read(4).unpack("L").first
        when 7
          [@file.read(1).unpack("C").first,
           @file.read(1).unpack("C").first,
           @file.read(1).unpack("C").first,
           @file.read(1).unpack("C").first]
        when 8
          l = @file.read(4).unpack("l").first
          s = @file.read(2*l).encode('UTF-8', 'UTF-16LE')
          s = nil if s=="NULL"
          s
        when 9
          @file.read(4).unpack("f").first
        when 11
          @file.read(8).unpack("q").first

        else
          log "unknown at pos #{@file.pos} ([#{column_type}] #{@header[icolumn]})"
          p @file.read(15)
          raise "Unknown column type"
        end
        log "[#{column_type}] #{@header[icolumn]}: #{value}"
        row << value
      end
      @data << row
    end
    log "EOF: #{@file.eof?} (#{@file.pos}/#{@file.size})"
    raise "EOF not reached" unless @file.eof?
  end
end
