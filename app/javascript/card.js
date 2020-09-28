const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // 環境変数を読み込む
  const form = document.getElementById("charge-form"); 
  form.addEventListener("submit", (e) => { // イベント発火
    e.preventDefault();

    // カード情報の取得先
  const formResult = document.getElementById("charge-form");
  const formData = new FormData(formResult);

  const card = { // カードオブジェクトを生成
      number: formData.get("order_donation[number]"),              // カード番号
      cvc: formData.get("order_donation[cvc]"),                    // カード裏面の3桁の数字
      exp_month: formData.get("order_donation[exp_month]"),        // 有効期限の月
      exp_year: `20${formData.get("order_donation[exp_year]")}`,   // 有効期限の年
    };
    //debugge
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");   //idを元に要素を取得
        const tokenObj = `<input value=${token} type="hidden" name='authenticity_token'>`;   //paramsの中にトークンを含める
        renderDom.insertAdjacentHTML("beforeend", tokenObj);  //フォームの一番最後に要素を追加

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }   
      else {
        render 'shared/error_messages', model: f.object
      }
    });
  });
};


window.addEventListener("load", pay);