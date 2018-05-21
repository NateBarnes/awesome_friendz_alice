defmodule Alice.Handlers.GrammarNazi do
  use Alice.Router
  @moduledoc "Corrects your terrible grammar. Not an actual Nazi. Does not condone Nazis."

  alias Alice.Conn

  route ~r/\b(((w|c|sh)ould(n't)?)|must) of\b/i, :correct_of
  route ~r/\b(((w|c|sh)ould(n't)?)|must)( have|'ve)\b/i, :positive_reinforcement

  @doc "Corrects your terrible grammar. Not an actual Nazi."
  def correct_of(%Conn{message: %{captures: captures, user: "U0LADD3C4"}}=conn) do
    [_full, word | _rest] = captures
    delayed_reply(~s(or maybe "#{word} have"), 1200, conn)
    delayed_reply("Anyway, you're welcome! :+1:", 3600, conn)
    delayed_reply("But seriously, you haven't learned by now?", 4500, conn)
    delayed_reply("I mean, it's not that hard.", 5000, conn)
    delayed_reply("I believe in you #{Conn.at_reply_user(conn)}", 6000, conn)
    delayed_reply("You can do it!", 7000, conn)
    delayed_reply("Also, here are some flowers: http://i.imgur.com/ioLp3DW.jpg", 10000, conn)
    reply(conn, ~s(Hey #{Conn.at_reply_user(conn)}, I think you mean "#{word}'ve"))
  end
  def correct_of(%Conn{message: %{captures: captures}}=conn) do
    [_full, word | _rest] = captures
    delayed_reply(~s(or maybe "#{word} have"), 1200, conn)
    delayed_reply("Anyway, you're welcome! :+1:", 3600, conn)
    reply(conn, ~s(Hey #{Conn.at_reply_user(conn)}, I think you mean "#{word}'ve"))
  end

  @doc "Provides positive reinforcement for a particular person"
  def correct_of(%Conn{message: %{user: "U0LADD3C4"}}=conn) do
    ~w[
      https://i.imgur.com/B8epvga.gif
      https://i.imgur.com/JslbdTv.gif
      https://i.imgur.com/CqSVcEH.gif
      https://i.imgur.com/TmLC46k.gif
      https://i.imgur.com/gLHz3Mu.gif
      https://i.imgur.com/33lJ7ZI.gif
      https://i.imgur.com/7tmxMQi.gif
      https://i.imgur.com/lxSevXD.gif
      https://i.imgur.com/VchK7iR.gif
      https://i.imgur.com/GeG1h3W.gif
      https://i.imgur.com/unx08jE.gif
      https://i.imgur.com/gViG0Ai.gif
      https://i.imgur.com/XnRrY1b.gif
      https://i.imgur.com/8zkZKMT.gif
      https://i.imgur.com/pYPmtXf.gif
      https://i.imgur.com/oujzXk0.gif
      https://i.imgur.com/7iiDWSi.gif
      https://i.imgur.com/9MBmprI.gif
      https://i.imgur.com/xfPShRI.gif
      https://i.imgur.com/l03zliY.gif
      https://i.imgur.com/bqkWGQO.gif
      https://i.imgur.com/9mQdKX6.gif
      https://i.imgur.com/2wGiZeF.gif
      https://i.imgur.com/cz2L0ni.gif
      https://i.imgur.com/jHjiHKE.gif
      https://i.imgur.com/gcnrLM7.gif
      https://i.imgur.com/sHLXCLX.gif
    ]
    |> random_reply(conn)
  end
end
