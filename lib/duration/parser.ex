# Generated from lib/duration/parser.ex.exs, do not edit.
# Generated at 2019-08-04 17:10:17Z.

defmodule Duration.Parser do
  @moduledoc false

  @doc """
  Parses the given `binary` as parse.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the parse (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec parse(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def parse(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(parse__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp parse__0(rest, acc, stack, context, line, offset) do
    parse__8(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp parse__2(rest, acc, stack, context, line, offset) do
    case(datetime_3__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        parse__3(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp parse__3(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__4(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__2(rest, [], stack, context, line, offset)
  end

  defp parse__5(rest, acc, stack, context, line, offset) do
    case(datetime_2__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        parse__6(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        parse__4(rest, acc, stack, context, line, offset)
    end
  end

  defp parse__6(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__7(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__5(rest, [], stack, context, line, offset)
  end

  defp parse__8(rest, acc, stack, context, line, offset) do
    case(datetime_1__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        parse__9(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        parse__7(rest, acc, stack, context, line, offset)
    end
  end

  defp parse__9(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__1(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as datetime_3.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the datetime_3 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec datetime_3(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def datetime_3(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(datetime_3__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_3__0(<<"P", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_3__1(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp datetime_3__0(rest, _acc, _stack, context, line, offset) do
    {:error, "expected string \"P\"", rest, context, line, offset}
  end

  defp datetime_3__1(rest, acc, stack, context, line, offset) do
    case(date_3__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        datetime_3__2(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_3__2(rest, acc, stack, context, line, offset) do
    datetime_3__6(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp datetime_3__4(rest, acc, [_, previous_acc | stack], context, line, offset) do
    datetime_3__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp datetime_3__5(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    datetime_3__4(rest, [], stack, context, line, offset)
  end

  defp datetime_3__6(<<"T", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_3__7(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp datetime_3__6(rest, acc, stack, context, line, offset) do
    datetime_3__5(rest, acc, stack, context, line, offset)
  end

  defp datetime_3__7(rest, acc, stack, context, line, offset) do
    case(time_3__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        datetime_3__8(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        datetime_3__5(rest, acc, stack, context, line, offset)
    end
  end

  defp datetime_3__8(rest, acc, [_, previous_acc | stack], context, line, offset) do
    datetime_3__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp datetime_3__3(<<""::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_3__9("", [] ++ acc, stack, context, comb__line, comb__offset)
  end

  defp datetime_3__3(rest, _acc, _stack, context, line, offset) do
    {:error, "expected end of string", rest, context, line, offset}
  end

  defp datetime_3__9(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as datetime_2.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the datetime_2 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec datetime_2(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def datetime_2(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(datetime_2__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_2__0(<<"P", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_2__1(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp datetime_2__0(rest, _acc, _stack, context, line, offset) do
    {:error, "expected string \"P\"", rest, context, line, offset}
  end

  defp datetime_2__1(rest, acc, stack, context, line, offset) do
    case(date_2__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        datetime_2__2(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_2__2(<<"T", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_2__3(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp datetime_2__2(rest, _acc, _stack, context, line, offset) do
    {:error, "expected string \"T\"", rest, context, line, offset}
  end

  defp datetime_2__3(rest, acc, stack, context, line, offset) do
    case(time_2__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        datetime_2__4(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_2__4(<<""::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_2__5("", [] ++ acc, stack, context, comb__line, comb__offset)
  end

  defp datetime_2__4(rest, _acc, _stack, context, line, offset) do
    {:error, "expected end of string", rest, context, line, offset}
  end

  defp datetime_2__5(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as datetime_1.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the datetime_1 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec datetime_1(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def datetime_1(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(datetime_1__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_1__0(<<"P", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_1__1(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp datetime_1__0(rest, _acc, _stack, context, line, offset) do
    {:error, "expected string \"P\"", rest, context, line, offset}
  end

  defp datetime_1__1(rest, acc, stack, context, line, offset) do
    case(date_1__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        datetime_1__2(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_1__2(<<"T", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_1__3(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp datetime_1__2(rest, _acc, _stack, context, line, offset) do
    {:error, "expected string \"T\"", rest, context, line, offset}
  end

  defp datetime_1__3(rest, acc, stack, context, line, offset) do
    case(time_1__0(rest, acc, [], context, line, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        datetime_1__4(rest, acc, stack, context, line, offset)

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp datetime_1__4(<<""::binary>>, acc, stack, context, comb__line, comb__offset) do
    datetime_1__5("", [] ++ acc, stack, context, comb__line, comb__offset)
  end

  defp datetime_1__4(rest, _acc, _stack, context, line, offset) do
    {:error, "expected end of string", rest, context, line, offset}
  end

  defp datetime_1__5(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as time_3.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the time_3 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec time_3(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def time_3(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(time_3__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp time_3__0(rest, acc, stack, context, line, offset) do
    time_3__4(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp time_3__2(rest, acc, [_, previous_acc | stack], context, line, offset) do
    time_3__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp time_3__3(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    time_3__2(rest, [], stack, context, line, offset)
  end

  defp time_3__4(rest, acc, stack, context, line, offset) do
    time_3__5(rest, [], [acc | stack], context, line, offset)
  end

  defp time_3__5(rest, acc, stack, context, line, offset) do
    time_3__6(rest, [], [acc | stack], context, line, offset)
  end

  defp time_3__6(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    time_3__7(rest, [x0 - 48] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__6(rest, acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    time_3__3(rest, acc, stack, context, line, offset)
  end

  defp time_3__7(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    time_3__9(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__7(rest, acc, stack, context, line, offset) do
    time_3__8(rest, acc, stack, context, line, offset)
  end

  defp time_3__9(rest, acc, stack, context, line, offset) do
    time_3__7(rest, acc, stack, context, line, offset)
  end

  defp time_3__8(rest, user_acc, [acc | stack], context, line, offset) do
    time_3__10(
      rest,
      (
        [head | tail] = :lists.reverse(user_acc)
        [:lists.foldl(fn x, acc -> x - 48 + acc * 10 end, head, tail)]
      ) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_3__10(<<"H", _::binary>> = rest, acc, stack, context, line, offset) do
    time_3__11(rest, acc, stack, context, line, offset)
  end

  defp time_3__10(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    time_3__3(rest, acc, stack, context, line, offset)
  end

  defp time_3__11(<<"H", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    time_3__12(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__11(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    time_3__3(rest, acc, stack, context, line, offset)
  end

  defp time_3__12(rest, user_acc, [acc | stack], context, line, offset) do
    time_3__13(
      rest,
      [
        hours:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_3__13(rest, acc, [_, previous_acc | stack], context, line, offset) do
    time_3__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp time_3__1(rest, acc, stack, context, line, offset) do
    time_3__17(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp time_3__15(rest, acc, [_, previous_acc | stack], context, line, offset) do
    time_3__14(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp time_3__16(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    time_3__15(rest, [], stack, context, line, offset)
  end

  defp time_3__17(rest, acc, stack, context, line, offset) do
    time_3__18(rest, [], [acc | stack], context, line, offset)
  end

  defp time_3__18(rest, acc, stack, context, line, offset) do
    time_3__19(rest, [], [acc | stack], context, line, offset)
  end

  defp time_3__19(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    time_3__20(rest, [x0 - 48] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__19(rest, acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    time_3__16(rest, acc, stack, context, line, offset)
  end

  defp time_3__20(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    time_3__22(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__20(rest, acc, stack, context, line, offset) do
    time_3__21(rest, acc, stack, context, line, offset)
  end

  defp time_3__22(rest, acc, stack, context, line, offset) do
    time_3__20(rest, acc, stack, context, line, offset)
  end

  defp time_3__21(rest, user_acc, [acc | stack], context, line, offset) do
    time_3__23(
      rest,
      (
        [head | tail] = :lists.reverse(user_acc)
        [:lists.foldl(fn x, acc -> x - 48 + acc * 10 end, head, tail)]
      ) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_3__23(<<"M", _::binary>> = rest, acc, stack, context, line, offset) do
    time_3__24(rest, acc, stack, context, line, offset)
  end

  defp time_3__23(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    time_3__16(rest, acc, stack, context, line, offset)
  end

  defp time_3__24(<<"M", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    time_3__25(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__24(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    time_3__16(rest, acc, stack, context, line, offset)
  end

  defp time_3__25(rest, user_acc, [acc | stack], context, line, offset) do
    time_3__26(
      rest,
      [
        minutes:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_3__26(rest, acc, [_, previous_acc | stack], context, line, offset) do
    time_3__14(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp time_3__14(rest, acc, stack, context, line, offset) do
    time_3__30(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp time_3__28(rest, acc, [_, previous_acc | stack], context, line, offset) do
    time_3__27(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp time_3__29(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    time_3__28(rest, [], stack, context, line, offset)
  end

  defp time_3__30(rest, acc, stack, context, line, offset) do
    time_3__31(rest, [], [acc | stack], context, line, offset)
  end

  defp time_3__31(rest, acc, stack, context, line, offset) do
    time_3__32(rest, [], [acc | stack], context, line, offset)
  end

  defp time_3__32(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    time_3__33(rest, [x0 - 48] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__32(rest, acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    time_3__29(rest, acc, stack, context, line, offset)
  end

  defp time_3__33(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    time_3__35(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__33(rest, acc, stack, context, line, offset) do
    time_3__34(rest, acc, stack, context, line, offset)
  end

  defp time_3__35(rest, acc, stack, context, line, offset) do
    time_3__33(rest, acc, stack, context, line, offset)
  end

  defp time_3__34(rest, user_acc, [acc | stack], context, line, offset) do
    time_3__36(
      rest,
      (
        [head | tail] = :lists.reverse(user_acc)
        [:lists.foldl(fn x, acc -> x - 48 + acc * 10 end, head, tail)]
      ) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_3__36(<<"S", _::binary>> = rest, acc, stack, context, line, offset) do
    time_3__37(rest, acc, stack, context, line, offset)
  end

  defp time_3__36(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    time_3__29(rest, acc, stack, context, line, offset)
  end

  defp time_3__37(<<"S", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    time_3__38(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_3__37(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    time_3__29(rest, acc, stack, context, line, offset)
  end

  defp time_3__38(rest, user_acc, [acc | stack], context, line, offset) do
    time_3__39(
      rest,
      [
        seconds:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_3__39(rest, acc, [_, previous_acc | stack], context, line, offset) do
    time_3__27(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp time_3__27(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as time_2.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the time_2 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec time_2(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def time_2(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(time_2__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp time_2__0(rest, acc, stack, context, line, offset) do
    time_2__1(rest, [], [acc | stack], context, line, offset)
  end

  defp time_2__1(rest, acc, stack, context, line, offset) do
    time_2__2(rest, [], [acc | stack], context, line, offset)
  end

  defp time_2__2(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    time_2__3(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp time_2__2(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp time_2__3(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 24)) do
      {user_acc, context} when is_list(user_acc) ->
        time_2__4(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp time_2__4(rest, user_acc, [acc | stack], context, line, offset) do
    time_2__5(
      rest,
      [
        hours:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_2__5(<<":", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    time_2__6(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_2__5(rest, _acc, _stack, context, line, offset) do
    {:error, "expected colon", rest, context, line, offset}
  end

  defp time_2__6(rest, acc, stack, context, line, offset) do
    time_2__7(rest, [], [acc | stack], context, line, offset)
  end

  defp time_2__7(rest, acc, stack, context, line, offset) do
    time_2__8(rest, [], [acc | stack], context, line, offset)
  end

  defp time_2__8(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    time_2__9(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp time_2__8(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp time_2__9(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 60)) do
      {user_acc, context} when is_list(user_acc) ->
        time_2__10(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp time_2__10(rest, user_acc, [acc | stack], context, line, offset) do
    time_2__11(
      rest,
      [
        minutes:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_2__11(<<":", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    time_2__12(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp time_2__11(rest, _acc, _stack, context, line, offset) do
    {:error, "expected colon", rest, context, line, offset}
  end

  defp time_2__12(rest, acc, stack, context, line, offset) do
    time_2__13(rest, [], [acc | stack], context, line, offset)
  end

  defp time_2__13(rest, acc, stack, context, line, offset) do
    time_2__14(rest, [], [acc | stack], context, line, offset)
  end

  defp time_2__14(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    time_2__15(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp time_2__14(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp time_2__15(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 60)) do
      {user_acc, context} when is_list(user_acc) ->
        time_2__16(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp time_2__16(rest, user_acc, [acc | stack], context, line, offset) do
    time_2__17(
      rest,
      [
        seconds:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_2__17(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as time_1.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the time_1 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec time_1(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def time_1(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(time_1__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp time_1__0(rest, acc, stack, context, line, offset) do
    time_1__1(rest, [], [acc | stack], context, line, offset)
  end

  defp time_1__1(rest, acc, stack, context, line, offset) do
    time_1__2(rest, [], [acc | stack], context, line, offset)
  end

  defp time_1__2(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    time_1__3(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp time_1__2(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp time_1__3(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 24)) do
      {user_acc, context} when is_list(user_acc) ->
        time_1__4(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp time_1__4(rest, user_acc, [acc | stack], context, line, offset) do
    time_1__5(
      rest,
      [
        hours:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_1__5(rest, acc, stack, context, line, offset) do
    time_1__6(rest, [], [acc | stack], context, line, offset)
  end

  defp time_1__6(rest, acc, stack, context, line, offset) do
    time_1__7(rest, [], [acc | stack], context, line, offset)
  end

  defp time_1__7(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    time_1__8(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp time_1__7(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp time_1__8(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 60)) do
      {user_acc, context} when is_list(user_acc) ->
        time_1__9(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp time_1__9(rest, user_acc, [acc | stack], context, line, offset) do
    time_1__10(
      rest,
      [
        minutes:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_1__10(rest, acc, stack, context, line, offset) do
    time_1__11(rest, [], [acc | stack], context, line, offset)
  end

  defp time_1__11(rest, acc, stack, context, line, offset) do
    time_1__12(rest, [], [acc | stack], context, line, offset)
  end

  defp time_1__12(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    time_1__13(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp time_1__12(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp time_1__13(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 60)) do
      {user_acc, context} when is_list(user_acc) ->
        time_1__14(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp time_1__14(rest, user_acc, [acc | stack], context, line, offset) do
    time_1__15(
      rest,
      [
        seconds:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp time_1__15(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as date_3.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the date_3 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec date_3(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def date_3(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(date_3__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp date_3__0(rest, acc, stack, context, line, offset) do
    date_3__4(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp date_3__2(rest, acc, [_, previous_acc | stack], context, line, offset) do
    date_3__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp date_3__3(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    date_3__2(rest, [], stack, context, line, offset)
  end

  defp date_3__4(rest, acc, stack, context, line, offset) do
    date_3__5(rest, [], [acc | stack], context, line, offset)
  end

  defp date_3__5(rest, acc, stack, context, line, offset) do
    date_3__6(rest, [], [acc | stack], context, line, offset)
  end

  defp date_3__6(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    date_3__7(rest, [x0 - 48] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__6(rest, acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    date_3__3(rest, acc, stack, context, line, offset)
  end

  defp date_3__7(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    date_3__9(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__7(rest, acc, stack, context, line, offset) do
    date_3__8(rest, acc, stack, context, line, offset)
  end

  defp date_3__9(rest, acc, stack, context, line, offset) do
    date_3__7(rest, acc, stack, context, line, offset)
  end

  defp date_3__8(rest, user_acc, [acc | stack], context, line, offset) do
    date_3__10(
      rest,
      (
        [head | tail] = :lists.reverse(user_acc)
        [:lists.foldl(fn x, acc -> x - 48 + acc * 10 end, head, tail)]
      ) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_3__10(<<"Y", _::binary>> = rest, acc, stack, context, line, offset) do
    date_3__11(rest, acc, stack, context, line, offset)
  end

  defp date_3__10(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    date_3__3(rest, acc, stack, context, line, offset)
  end

  defp date_3__11(<<"Y", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    date_3__12(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__11(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    date_3__3(rest, acc, stack, context, line, offset)
  end

  defp date_3__12(rest, user_acc, [acc | stack], context, line, offset) do
    date_3__13(
      rest,
      [
        years:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_3__13(rest, acc, [_, previous_acc | stack], context, line, offset) do
    date_3__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp date_3__1(rest, acc, stack, context, line, offset) do
    date_3__17(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp date_3__15(rest, acc, [_, previous_acc | stack], context, line, offset) do
    date_3__14(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp date_3__16(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    date_3__15(rest, [], stack, context, line, offset)
  end

  defp date_3__17(rest, acc, stack, context, line, offset) do
    date_3__18(rest, [], [acc | stack], context, line, offset)
  end

  defp date_3__18(rest, acc, stack, context, line, offset) do
    date_3__19(rest, [], [acc | stack], context, line, offset)
  end

  defp date_3__19(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    date_3__20(rest, [x0 - 48] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__19(rest, acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    date_3__16(rest, acc, stack, context, line, offset)
  end

  defp date_3__20(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    date_3__22(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__20(rest, acc, stack, context, line, offset) do
    date_3__21(rest, acc, stack, context, line, offset)
  end

  defp date_3__22(rest, acc, stack, context, line, offset) do
    date_3__20(rest, acc, stack, context, line, offset)
  end

  defp date_3__21(rest, user_acc, [acc | stack], context, line, offset) do
    date_3__23(
      rest,
      (
        [head | tail] = :lists.reverse(user_acc)
        [:lists.foldl(fn x, acc -> x - 48 + acc * 10 end, head, tail)]
      ) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_3__23(<<"M", _::binary>> = rest, acc, stack, context, line, offset) do
    date_3__24(rest, acc, stack, context, line, offset)
  end

  defp date_3__23(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    date_3__16(rest, acc, stack, context, line, offset)
  end

  defp date_3__24(<<"M", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    date_3__25(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__24(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    date_3__16(rest, acc, stack, context, line, offset)
  end

  defp date_3__25(rest, user_acc, [acc | stack], context, line, offset) do
    date_3__26(
      rest,
      [
        months:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_3__26(rest, acc, [_, previous_acc | stack], context, line, offset) do
    date_3__14(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp date_3__14(rest, acc, stack, context, line, offset) do
    date_3__30(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp date_3__28(rest, acc, [_, previous_acc | stack], context, line, offset) do
    date_3__27(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp date_3__29(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    date_3__28(rest, [], stack, context, line, offset)
  end

  defp date_3__30(rest, acc, stack, context, line, offset) do
    date_3__31(rest, [], [acc | stack], context, line, offset)
  end

  defp date_3__31(rest, acc, stack, context, line, offset) do
    date_3__32(rest, [], [acc | stack], context, line, offset)
  end

  defp date_3__32(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    date_3__33(rest, [x0 - 48] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__32(rest, acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    date_3__29(rest, acc, stack, context, line, offset)
  end

  defp date_3__33(<<x0::integer, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    date_3__35(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__33(rest, acc, stack, context, line, offset) do
    date_3__34(rest, acc, stack, context, line, offset)
  end

  defp date_3__35(rest, acc, stack, context, line, offset) do
    date_3__33(rest, acc, stack, context, line, offset)
  end

  defp date_3__34(rest, user_acc, [acc | stack], context, line, offset) do
    date_3__36(
      rest,
      (
        [head | tail] = :lists.reverse(user_acc)
        [:lists.foldl(fn x, acc -> x - 48 + acc * 10 end, head, tail)]
      ) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_3__36(<<"D", _::binary>> = rest, acc, stack, context, line, offset) do
    date_3__37(rest, acc, stack, context, line, offset)
  end

  defp date_3__36(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    date_3__29(rest, acc, stack, context, line, offset)
  end

  defp date_3__37(<<"D", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    date_3__38(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_3__37(rest, acc, stack, context, line, offset) do
    [acc | stack] = stack
    date_3__29(rest, acc, stack, context, line, offset)
  end

  defp date_3__38(rest, user_acc, [acc | stack], context, line, offset) do
    date_3__39(
      rest,
      [
        days:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_3__39(rest, acc, [_, previous_acc | stack], context, line, offset) do
    date_3__27(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp date_3__27(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as date_2.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the date_2 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec date_2(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def date_2(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(date_2__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp date_2__0(
         <<x0::integer, x1::integer, x2::integer, x3::integer, "-", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) and (x2 >= 48 and x2 <= 57) and
              (x3 >= 48 and x3 <= 57) do
    date_2__1(
      rest,
      [years: x3 - 48 + (x2 - 48) * 10 + (x1 - 48) * 100 + (x0 - 48) * 1000] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 5
    )
  end

  defp date_2__0(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 4 digits, followed by dash", rest, context, line, offset}
  end

  defp date_2__1(rest, acc, stack, context, line, offset) do
    date_2__2(rest, [], [acc | stack], context, line, offset)
  end

  defp date_2__2(rest, acc, stack, context, line, offset) do
    date_2__3(rest, [], [acc | stack], context, line, offset)
  end

  defp date_2__3(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    date_2__4(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp date_2__3(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp date_2__4(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 12)) do
      {user_acc, context} when is_list(user_acc) ->
        date_2__5(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp date_2__5(rest, user_acc, [acc | stack], context, line, offset) do
    date_2__6(
      rest,
      [
        months:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_2__6(<<"-", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    date_2__7(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp date_2__6(rest, _acc, _stack, context, line, offset) do
    {:error, "expected dash", rest, context, line, offset}
  end

  defp date_2__7(rest, acc, stack, context, line, offset) do
    date_2__8(rest, [], [acc | stack], context, line, offset)
  end

  defp date_2__8(rest, acc, stack, context, line, offset) do
    date_2__9(rest, [], [acc | stack], context, line, offset)
  end

  defp date_2__9(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    date_2__10(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp date_2__9(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp date_2__10(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 31)) do
      {user_acc, context} when is_list(user_acc) ->
        date_2__11(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp date_2__11(rest, user_acc, [acc | stack], context, line, offset) do
    date_2__12(
      rest,
      [
        days:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_2__12(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  @doc """
  Parses the given `binary` as date_1.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the date_1 (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec date_1(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def date_1(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(date_1__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp date_1__0(
         <<x0::integer, x1::integer, x2::integer, x3::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) and (x2 >= 48 and x2 <= 57) and
              (x3 >= 48 and x3 <= 57) do
    date_1__1(
      rest,
      [years: x3 - 48 + (x2 - 48) * 10 + (x1 - 48) * 100 + (x0 - 48) * 1000] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 4
    )
  end

  defp date_1__0(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 4 digits", rest, context, line, offset}
  end

  defp date_1__1(rest, acc, stack, context, line, offset) do
    date_1__2(rest, [], [acc | stack], context, line, offset)
  end

  defp date_1__2(rest, acc, stack, context, line, offset) do
    date_1__3(rest, [], [acc | stack], context, line, offset)
  end

  defp date_1__3(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    date_1__4(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp date_1__3(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp date_1__4(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 12)) do
      {user_acc, context} when is_list(user_acc) ->
        date_1__5(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp date_1__5(rest, user_acc, [acc | stack], context, line, offset) do
    date_1__6(
      rest,
      [
        months:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_1__6(rest, acc, stack, context, line, offset) do
    date_1__7(rest, [], [acc | stack], context, line, offset)
  end

  defp date_1__7(rest, acc, stack, context, line, offset) do
    date_1__8(rest, [], [acc | stack], context, line, offset)
  end

  defp date_1__8(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) do
    date_1__9(
      rest,
      [x1 - 48 + (x0 - 48) * 10] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp date_1__8(rest, _acc, _stack, context, line, offset) do
    {:error, "expected 2 digits", rest, context, line, offset}
  end

  defp date_1__9(rest, user_acc, [acc | stack], context, line, offset) do
    case(validate_moduli(rest, user_acc, context, line, offset, 31)) do
      {user_acc, context} when is_list(user_acc) ->
        date_1__10(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp date_1__10(rest, user_acc, [acc | stack], context, line, offset) do
    date_1__11(
      rest,
      [
        days:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp date_1__11(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end

  defp validate_moduli(_rest, args, context, _line, _offset, moduli) do
    if Enum.any?(args, fn x -> x > moduli end) do
      [head | _] = args
      {:error, "moduli #{head} / #{moduli}"}
    else
      {args, context}
    end
  end
end
