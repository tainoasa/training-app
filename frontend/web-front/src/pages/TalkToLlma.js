import React from 'react'

const TalkToLlma = () => {
  return (
    <div>
      <form action="#" method="post">
        <p className="text">テキストを入力:</p>
        <input
          type="text"
          name="comment"
          size="50"
          autoComplete="off"
          placeholder="（例）野球で速球を投げれるようになりたい"
        />
      </form>

      <div className="ai">
        <div className="trainning-menu">
          <img src="筋肉.png" alt="筋肉" />
        </div>

        <div className="set">
          <div className="today">
            <p>Today's Trainning Menu ...</p>
          </div>
          <div className="arrow_box">
            <strong>&lt; 下半身の筋力トレーニング &gt;</strong>
            <br />
            ・スクワット:
            クワットは大腿四頭筋、ハムストリングス、臀部を強化します。バーベルやダンベルを使用して行います。
            <br />
            ・デッドリフト:
            デッドリフトは腰椎、大腿筋、ハムストリングス、広背筋などを鍛える効果的なエクササイズです。
            <br />
            <strong>&lt; 腹部筋力トレーニング &gt;</strong>
            <br />
            ・プランク: 腹部のコアを鍛え、バランスを向上させるのに効果的です。
            <br />
            ・レッグレイズ: 下腹部の筋肉を強化し、投球動作の安定性を高めます。
            <br />
            <strong>&lt; 肩とアームの筋力トレーニング &gt;</strong>
            <br />
            ・ローターカフエクササイズ:
            ローターカフ（肩関節周りの筋肉群）を強化するために、サイドレイズや内外転のエクササイズを行います。
            <br />
            ・ワイドグリッププルアップ:
            ラットプルダウンマシンやバーベルを使用して、上腕二頭筋と背中の筋肉を鍛えます。
            <br />
            ・ワンアームダンベルカール:
            腕の屈曲力を向上させ、速球を投げる際のアームスピードを向上させるのに役立ちます。
            <br />
            <strong>&lt; 脚の爆発力トレーニング &gt;</strong>
            <br />
            ・ピリオメトリクストレーニング:
            ボックスジャンプ、バウンド、スプリントなどのエクササイズで脚の爆発力を向上させます。
            <br />
            <strong>&lt; 体幹トレーニング &gt;</strong>
            <br />
            ・メディシンボールスラムやロシアンツイストなどの体幹トレーニングを行い、投球時の安定性を高めます。
          </div>
          <div className="image-trainner">
            <img src="gym_trainner.gif" alt="トレーナー" />
            <p>AIジムトレーナーマッスル木村</p>
          </div>
        </div>
      </div>

      <div className="history"></div>
    </div>
  )
}

export default TalkToLlma