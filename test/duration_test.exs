defmodule DurationTest do
  use ExUnit.Case
  doctest Duration

  test "parse durations" do
    assert Duration.parse("PT3S") == {:ok, %Duration{seconds: 3}}
    assert Duration.parse("P3M") == {:ok, %Duration{months: 3}}
    assert Duration.parse("PT3M") == {:ok, %Duration{minutes: 3}}

    assert Duration.parse("P12341223T235759") ==
             {:ok,
              %Duration{years: 1234, months: 12, days: 23, hours: 23, minutes: 57, seconds: 59}}

    assert Duration.parse("P1234-12-23T23:57:59") ==
             {:ok,
              %Duration{years: 1234, months: 12, days: 23, hours: 23, minutes: 57, seconds: 59}}
  end

  test "string protocol" do
    assert to_string(%Duration{}) == "PT0S"
    assert to_string(%Duration{years: 1}) == "P1Y"
    assert to_string(%Duration{months: 1}) == "P1M"
    assert to_string(%Duration{years: 1, seconds: 12}) == "P1YT12S"
    assert to_string(%Duration{years: 1, months: 2, days: 3}) == "P1Y2M3D"

    assert to_string(%Duration{years: 1, months: 2, days: 3, hours: 4, minutes: 5, seconds: 6}) ==
             "P1Y2M3DT4H5M6S"

    assert to_string(%Duration{minutes: 1}) == "PT1M"
    assert to_string(%Duration{hours: 1, minutes: 2, seconds: 3}) == "PT1H2M3S"
    assert to_string(%Duration{hours: 0, minutes: 2, seconds: 3}) == "PT2M3S"
    assert to_string(%Duration{hours: 0, minutes: 0, seconds: 3}) == "PT3S"
  end

  test "errors" do
    assert {:error, _} = Duration.parse("")
    assert {:error, _} = Duration.parse("P12341331T246060")
    assert {:error, _} = Duration.parse("P12341232T246060")
    assert {:error, _} = Duration.parse("P12341231T256060")
    assert {:error, _} = Duration.parse("P12341231T246160")
    assert {:error, _} = Duration.parse("P12341231T246061")
  end

  test "Timex.integration" do
    {:ok, duration} = Duration.new("PT1S")
    assert {:ok, [seconds: 1]} = Duration.to_timex_options(duration, :forward)
    assert {:ok, [seconds: -1]} = Duration.to_timex_options(duration, :backward)
  end
end
