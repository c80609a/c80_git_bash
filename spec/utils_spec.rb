require 'spec_helper'

describe 'C80GitBash::Utils' do

  include C80GitBash::Utils

  it '#format_file_name: должен отформатировать строку, содержащую название директории'

  it '#format_git_message: должен разбить длинную строку на строки равной величины' do

    s = 'develop_map_data: models + admin: в админке появился пункт меню "Здания + Этажи": можно просматривать список зданий, этажей и их площадей и редактировать его. В карте можно назначать полигонам здания.'

    expected = [
        'develop_map_data: models + admin: в админке появился пункт меню "Здан',
        'ия + Этажи": можно просматривать список зданий, этажей и их площадей ',
        'и редактировать его. В карте можно назначать полигонам здания.       '
    ]

    actual = format_git_message(s)
    # puts actual
    expect(actual).to match_array(expected)

  end

  it '#format_git_date: должен отформатировать дату лога'

end