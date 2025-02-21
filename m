Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F39253336
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Feb 2025 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740168660; cv=none; b=sJ8LExPSYirWxOd+G+zGLyE8UGffvdz+lQFLV4UgX2//rrXAz6OerfWCCLDJMqrQvnLXdJ+q0UXTSmEwG0bHra16npWgfqCWbBeuSNLCqVQ0NDCZB4pwtFWUxnOXGGVehOZw5gu4z1drH53hzNEVXwv74iwzrlzNMW3TjtMS1kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740168660; c=relaxed/simple;
	bh=EDWww/LgXi4rD2gjhpGMFHSy1Axfqo7k3FPoX59UcOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEUg3xY/De0BZi3RGj0xWDAEcqw0ijj4OjZTgZMFje0DammyqWZ02oyDjzrQ47S+yiHoYk4No75f+ht2Ni+rQd9yYfq577aDrIs0PS93C/BYADJTpvL9ORh07Xb7y/MzvFD4Ifdv3iW5CtB6+u1LBfHue32PiwvN8LfRwwmpS00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=dUBlFg1l; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="dUBlFg1l"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e05780509dso3593159a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Feb 2025 12:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1740168655; x=1740773455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo9ISiBdYLAO7mwWcXDsfQJTeIVmf8ba5d1w8C/Q7H8=;
        b=dUBlFg1li9W9ijZ5XW04sUbkKVadrbPTx1upHDq/F43vjBJ5vX5Hp+35eMOLJPEBFQ
         nr6W1TQRD4S0NNCT6k0LyMT9GBERW+IPEzB58+zOO4hKHTnhsvs9S4zHfkw27iv6djjO
         0Yj/qfiOjwrrotD6zi1zoKbHxjRdVQRq6CY90cTRnRyoe6iqXLW7l65EopKCX3DYOQfD
         UYP2u7amYqOnxswm+C8AqtGBOujs6IDRnE6cIF7hi0ggswuasjXoAGNte17coEhHMjmo
         KwPi4W5Vii09seTRXR7P2wCYc0baz3t31KOFzBctCDLoWsVKUmqhQ+TBlpwPFUa+Y/P2
         +9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168655; x=1740773455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo9ISiBdYLAO7mwWcXDsfQJTeIVmf8ba5d1w8C/Q7H8=;
        b=fS6uqXwjeCToAP3axeuebgxYbwB57eePr3XRbysfuaKce1NeiX/2rBjFXmCx5PNZJN
         Eb0oifIuzSeQ4qVzYeCyQinEXXxCOm3TsxRghtw77VPrwDyrfujDK7DKZJ8ugoGMvZcl
         Fo6PvT391xI7MhWuPOF4r7RV7E/RKIQCyzf1rj6/ntwumqV97tUOxUfz9sAgSr7xRbtw
         6NbDDrBAb+PHt4aYI05dcL8HdBSpUnCohhuc0mIsZDp3DAVwTcYKmSaFc9vE2P5VVooi
         8/v2ZuU2hJgtaHB1xrm2qv7di+aeLYT7PHu7d32Wnv7vQKSIOmzTduWZVX8jETPJbcvF
         21tg==
X-Forwarded-Encrypted: i=1; AJvYcCUAoFDZQsyDwlgDggQ0aqJZ0vwO6EzgatcH+OpJGe0JfND9qjvuk9MCnWeysJbCF91HOegp7ddKaVbZeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZPn5eHWFXR7vHRU0bIIXZ5TqrB1apKfIsJHlBtxGDsKIFkEr
	y17KtJEx+0oi1DnUYGQijM78qTCMt6Cend02ipDNJqxW3hLl85azkxEwxXBHv0JpS4/iVgILZyz
	5E/n/ijT9Mu6EnAByIFJuaVw8e91966YFomD1VA==
X-Gm-Gg: ASbGncswfeumJkM0w2SAyyvGEZuf4IjpaoAQQOmEglNJJ7gGfvZkSG7/lda1pwvBJ+Z
	x8Kel3rptv5WV2h9g54iVjTh1pPgZAjakNPh7wje+nvzTpFJwy02mL3qXqP4zCZCzjCwLBTSz30
	BtNvJtdRij
X-Google-Smtp-Source: AGHT+IH2/qlbQgPbIh/nbYWi/sUpWIZX1a8MxJ070ntxeD0TZgcVfNJ3nmCoSR7bEK91zKOVWBiymAVyhtJ0SVa7Cyo=
X-Received: by 2002:a05:6402:51cf:b0:5e0:8c35:a137 with SMTP id
 4fb4d7f45d1cf-5e0b7247888mr3715021a12.23.1740168655462; Fri, 21 Feb 2025
 12:10:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221032141.1206902-1-alexey.klimov@linaro.org>
In-Reply-To: <20250221032141.1206902-1-alexey.klimov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 21 Feb 2025 14:10:44 -0600
X-Gm-Features: AWEUYZkAkKBDn-7D-WRkZwle1yjWvpLxfhceFL155lYDXn9_dqF05SAG85Mwlwo
Message-ID: <CAKXuJqj4zKfA4HNNcooG5Ffqi+EKQ1RvuzWndZd=htoatwszOw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: wsa883x: Implement temperature reading
 and hwmon
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, broonie@kernel.org, lgirdwood@gmail.com, 
	krzysztof.kozlowski@linaro.org, perex@perex.cz, tiwai@suse.com, 
	jdelvare@suse.com, linux@roeck-us.net, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

On Thu, Feb 20, 2025 at 9:21=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Read temperature of the amplifier and expose it via hwmon interface, whic=
h
> will be later used during calibration of speaker protection algorithms.
> The method is the same as for wsa884x and therefore this is based on
> Krzysztof Kozlowski's approach implemented in commit 6b99dc62d940 ("ASoC:
> codecs: wsa884x: Implement temperature reading and hwmon").
>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>
> Changes in v2:
> - add temperature conversion to millidegrees of Celcius
>   when amplifier is on to report correct data to hwmon;
> - minor coding style fixes to make checkpatch --strict happy;
> - correct typo (reference to wsa884x in the comment), small rewording.
>
>  sound/soc/codecs/wsa883x.c | 194 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
>
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index 47da5674d7c9..a5a6cb90bb43 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -6,6 +6,7 @@
>  #include <linux/bitops.h>
>  #include <linux/device.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/hwmon.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -156,8 +157,28 @@
>  #define WSA883X_PA_FSM_ERR_COND         (WSA883X_DIG_CTRL_BASE + 0x0014)
>  #define WSA883X_PA_FSM_MSK              (WSA883X_DIG_CTRL_BASE + 0x0015)
>  #define WSA883X_PA_FSM_BYP              (WSA883X_DIG_CTRL_BASE + 0x0016)
> +#define WSA883X_PA_FSM_BYP_DC_CAL_EN_MASK              0x01
> +#define WSA883X_PA_FSM_BYP_DC_CAL_EN_SHIFT             0
> +#define WSA883X_PA_FSM_BYP_CLK_WD_EN_MASK              0x02
> +#define WSA883X_PA_FSM_BYP_CLK_WD_EN_SHIFT             1
> +#define WSA883X_PA_FSM_BYP_BG_EN_MASK                  0x04
> +#define WSA883X_PA_FSM_BYP_BG_EN_SHIFT                 2
> +#define WSA883X_PA_FSM_BYP_BOOST_EN_MASK               0x08
> +#define WSA883X_PA_FSM_BYP_BOOST_EN_SHIFT              3
> +#define WSA883X_PA_FSM_BYP_PA_EN_MASK                  0x10
> +#define WSA883X_PA_FSM_BYP_PA_EN_SHIFT                 4
> +#define WSA883X_PA_FSM_BYP_D_UNMUTE_MASK               0x20
> +#define WSA883X_PA_FSM_BYP_D_UNMUTE_SHIFT              5
> +#define WSA883X_PA_FSM_BYP_SPKR_PROT_EN_MASK           0x40
> +#define WSA883X_PA_FSM_BYP_SPKR_PROT_EN_SHIFT          6
> +#define WSA883X_PA_FSM_BYP_TSADC_EN_MASK               0x80
> +#define WSA883X_PA_FSM_BYP_TSADC_EN_SHIFT              7
>  #define WSA883X_PA_FSM_DBG              (WSA883X_DIG_CTRL_BASE + 0x0017)
>  #define WSA883X_TADC_VALUE_CTL          (WSA883X_DIG_CTRL_BASE + 0x0020)
> +#define WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK   0x01
> +#define WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_SHIFT  0
> +#define WSA883X_TADC_VALUE_CTL_VBAT_VALUE_RD_EN_MASK   0x02
> +#define WSA883X_TADC_VALUE_CTL_VBAT_VALUE_RD_EN_SHIFT  1
>  #define WSA883X_TEMP_DETECT_CTL         (WSA883X_DIG_CTRL_BASE + 0x0021)
>  #define WSA883X_TEMP_MSB                (WSA883X_DIG_CTRL_BASE + 0x0022)
>  #define WSA883X_TEMP_LSB                (WSA883X_DIG_CTRL_BASE + 0x0023)
> @@ -427,6 +448,17 @@
>                 SNDRV_PCM_FMTBIT_S24_LE |\
>                 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
>
> +/* Two-point trimming for temperature calibration */
> +#define WSA883X_T1_TEMP                        -10L
> +#define WSA883X_T2_TEMP                        150L
> +
> +/*
> + * Device will report senseless data in many cases, so discard any measu=
rements
> + * outside of valid range.
> + */
> +#define WSA883X_LOW_TEMP_THRESHOLD     5
> +#define WSA883X_HIGH_TEMP_THRESHOLD    45
> +
>  struct wsa883x_priv {
>         struct regmap *regmap;
>         struct device *dev;
> @@ -441,6 +473,13 @@ struct wsa883x_priv {
>         int active_ports;
>         int dev_mode;
>         int comp_offset;
> +       /*
> +        * Protects temperature reading code (related to speaker protecti=
on) and
> +        * fields: temperature and pa_on.
> +        */
> +       struct mutex sp_lock;
> +       unsigned int temperature;
> +       bool pa_on;
>  };
>
>  enum {
> @@ -1186,6 +1225,10 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_=
widget *w,
>
>         switch (event) {
>         case SND_SOC_DAPM_POST_PMU:
> +               mutex_lock(&wsa883x->sp_lock);
> +               wsa883x->pa_on =3D true;
> +               mutex_unlock(&wsa883x->sp_lock);
> +
>                 switch (wsa883x->dev_mode) {
>                 case RECEIVER:
>                         snd_soc_component_write_field(component, WSA883X_=
CDC_PATH_MODE,
> @@ -1235,6 +1278,9 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_w=
idget *w,
>                                               WSA883X_GLOBAL_PA_EN_MASK, =
0);
>                 snd_soc_component_write_field(component, WSA883X_PDM_WD_C=
TL,
>                                               WSA883X_PDM_EN_MASK, 0);
> +               mutex_lock(&wsa883x->sp_lock);
> +               wsa883x->pa_on =3D false;
> +               mutex_unlock(&wsa883x->sp_lock);
>                 break;
>         }
>         return 0;
> @@ -1367,6 +1413,140 @@ static struct snd_soc_dai_driver wsa883x_dais[] =
=3D {
>         },
>  };
>
> +static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
> +{
> +       unsigned int d1_msb =3D 0, d1_lsb =3D 0, d2_msb =3D 0, d2_lsb =3D=
 0;
> +       unsigned int dmeas_msb =3D 0, dmeas_lsb =3D 0;
> +       int d1, d2, dmeas;
> +       unsigned int mask;
> +       int ret, range;
> +       long val;
> +
> +       guard(mutex)(&wsa883x->sp_lock);
> +
> +       if (wsa883x->pa_on) {
> +               /*
> +                * Reading temperature is possible only when Power Amplif=
ier is
> +                * off. Report last cached data.
> +                */
> +               *temp =3D wsa883x->temperature * 1000;
> +               return 0;
> +       }
> +
> +       ret =3D pm_runtime_resume_and_get(wsa883x->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       mask =3D WSA883X_PA_FSM_BYP_DC_CAL_EN_MASK |
> +              WSA883X_PA_FSM_BYP_CLK_WD_EN_MASK |
> +              WSA883X_PA_FSM_BYP_BG_EN_MASK |
> +              WSA883X_PA_FSM_BYP_D_UNMUTE_MASK |
> +              WSA883X_PA_FSM_BYP_SPKR_PROT_EN_MASK |
> +              WSA883X_PA_FSM_BYP_TSADC_EN_MASK;
> +
> +       /*
> +        * Here and further do not care about read or update failures.
> +        * For example, before turning the amplifier on for the first
> +        * time, reading WSA883X_TEMP_DIN_MSB will always return 0.
> +        * Instead, check if returned value is within reasonable
> +        * thresholds.
> +        */
> +       regmap_update_bits(wsa883x->regmap, WSA883X_PA_FSM_BYP, mask, mas=
k);
> +
> +       regmap_update_bits(wsa883x->regmap, WSA883X_TADC_VALUE_CTL,
> +                          WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK,
> +                          FIELD_PREP(WSA883X_TADC_VALUE_CTL_TEMP_VALUE_R=
D_EN_MASK, 0x0));
> +
> +       regmap_read(wsa883x->regmap, WSA883X_TEMP_MSB, &dmeas_msb);
> +       regmap_read(wsa883x->regmap, WSA883X_TEMP_LSB, &dmeas_lsb);
> +
> +       regmap_update_bits(wsa883x->regmap, WSA883X_TADC_VALUE_CTL,
> +                          WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK,
> +                          FIELD_PREP(WSA883X_TADC_VALUE_CTL_TEMP_VALUE_R=
D_EN_MASK, 0x1));
> +
> +       regmap_read(wsa883x->regmap, WSA883X_OTP_REG_1, &d1_msb);
> +       regmap_read(wsa883x->regmap, WSA883X_OTP_REG_2, &d1_lsb);
> +       regmap_read(wsa883x->regmap, WSA883X_OTP_REG_3, &d2_msb);
> +       regmap_read(wsa883x->regmap, WSA883X_OTP_REG_4, &d2_lsb);
> +
> +       regmap_update_bits(wsa883x->regmap, WSA883X_PA_FSM_BYP, mask, 0x0=
);
> +
> +       dmeas =3D (((dmeas_msb & 0xff) << 0x8) | (dmeas_lsb & 0xff)) >> 0=
x6;
> +       d1 =3D (((d1_msb & 0xff) << 0x8) | (d1_lsb & 0xff)) >> 0x6;
> +       d2 =3D (((d2_msb & 0xff) << 0x8) | (d2_lsb & 0xff)) >> 0x6;
> +
> +       if (d1 =3D=3D d2) {
> +               /* Incorrect data in OTP? */
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       val =3D WSA883X_T1_TEMP + (((dmeas - d1) * (WSA883X_T2_TEMP - WSA=
883X_T1_TEMP)) / (d2 - d1));
> +       range =3D WSA883X_HIGH_TEMP_THRESHOLD - WSA883X_LOW_TEMP_THRESHOL=
D;
> +       if (in_range(val, WSA883X_LOW_TEMP_THRESHOLD, range)) {
> +               wsa883x->temperature =3D val;
> +               *temp =3D val * 1000;
> +               ret =3D 0;
> +       } else {
> +               ret =3D -EAGAIN;
> +       }
> +out:
> +       pm_runtime_mark_last_busy(wsa883x->dev);
> +       pm_runtime_put_autosuspend(wsa883x->dev);
> +
> +       return ret;
> +}
> +
> +static umode_t wsa883x_hwmon_is_visible(const void *data,
> +                                       enum hwmon_sensor_types type, u32=
 attr,
> +                                       int channel)
> +{
> +       if (type !=3D hwmon_temp)
> +               return 0;
> +
> +       switch (attr) {
> +       case hwmon_temp_input:
> +               return 0444;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int wsa883x_hwmon_read(struct device *dev,
> +                             enum hwmon_sensor_types type,
> +                             u32 attr, int channel, long *temp)
> +{
> +       int ret;
> +
> +       switch (attr) {
> +       case hwmon_temp_input:
> +               ret =3D wsa883x_get_temp(dev_get_drvdata(dev), temp);
> +               break;
> +       default:
> +               ret =3D -EOPNOTSUPP;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static const struct hwmon_channel_info *const wsa883x_hwmon_info[] =3D {
> +       HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +       NULL
> +};
> +
> +static const struct hwmon_ops wsa883x_hwmon_ops =3D {
> +       .is_visible     =3D wsa883x_hwmon_is_visible,
> +       .read           =3D wsa883x_hwmon_read,
> +};
> +
> +static const struct hwmon_chip_info wsa883x_hwmon_chip_info =3D {
> +       .ops    =3D &wsa883x_hwmon_ops,
> +       .info   =3D wsa883x_hwmon_info,
> +};
> +
>  static int wsa883x_probe(struct sdw_slave *pdev,
>                          const struct sdw_device_id *id)
>  {
> @@ -1402,6 +1582,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>         wsa883x->sconfig.bps =3D 1;
>         wsa883x->sconfig.direction =3D SDW_DATA_DIR_RX;
>         wsa883x->sconfig.type =3D SDW_STREAM_PDM;
> +       mutex_init(&wsa883x->sp_lock);
>
>         /**
>          * Port map index starts with 0, however the data port for this c=
odec
> @@ -1424,6 +1605,19 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>                                     "regmap_init failed\n");
>                 goto err;
>         }
> +
> +       if (IS_REACHABLE(CONFIG_HWMON)) {
> +               struct device *hwmon;
> +
> +               hwmon =3D devm_hwmon_device_register_with_info(dev, "wsa8=
83x",
> +                                                            wsa883x,
> +                                                            &wsa883x_hwm=
on_chip_info,
> +                                                            NULL);
> +               if (IS_ERR(hwmon))
> +                       return dev_err_probe(dev, PTR_ERR(hwmon),
> +                                            "Failed to register hwmon se=
nsor\n");
> +       }
> +
>         pm_runtime_set_autosuspend_delay(dev, 3000);
>         pm_runtime_use_autosuspend(dev);
>         pm_runtime_mark_last_busy(dev);
> --
> 2.47.2
>

With v2 applied, I do get the cached value showing up in monitoring
and not 0C or 1C whenever audio playback occurs!

Tested-by: Steev Klimaszewski <steev@kali.org> #Thinkpad X13s
