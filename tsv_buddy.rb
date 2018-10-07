# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    rows = tsv.split("\n").map { |line| line.split("\t") }
    keys = rows.first
    rows[1..-1].map { |values| @data << keys.zip(values).to_h }
    @data
  rescue StandardError => e
    raise e.message
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    @tsv = ''
    @data.each_with_index do |hash_item, index|
      @tsv += hash_item.keys.join("\t") + "\n" if index.zero?
      @tsv += hash_item.values.join("\t") + "\n"
    end
    @tsv
  rescue StandardError => e
    raise e.message
  end
end
