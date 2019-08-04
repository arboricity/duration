defmodule DurationTest do
  use ExUnit.Case
  doctest Duration

  test "parse durations" do
    assert Duration.parse_duration("PT3S") == {:ok, %Duration{seconds: 3}}
    assert Duration.parse_duration("P3M") == {:ok, %Duration{months: 3}}
    assert Duration.parse_duration("PT3M") == {:ok, %Duration{minutes: 3}}

    assert Duration.parse_duration("P12341223T235759") ==
             {:ok,
              %Duration{years: 1234, months: 12, days: 23, hours: 23, minutes: 57, seconds: 59}}

    assert Duration.parse_duration("P1234-12-23T23:57:59") ==
             {:ok,
              %Duration{years: 1234, months: 12, days: 23, hours: 23, minutes: 57, seconds: 59}}
  end

  test "string protocol" do
    assert to_string(%Duration{}) == "PT0S"
    assert to_string(%Duration{years: 1}) == "P1Y"
    assert to_string(%Duration{years: 1, seconds: 12}) == "P1Y12S"
  end

  test "errors" do
    assert {:error, _} = Duration.parse_duration("")
    assert {:error, _} = Duration.parse_duration("P12341331T246060")
    assert {:error, _} = Duration.parse_duration("P12341232T246060")
    assert {:error, _} = Duration.parse_duration("P12341231T256060")
    assert {:error, _} = Duration.parse_duration("P12341231T246160")
    assert {:error, _} = Duration.parse_duration("P12341231T246061")
  end
end
