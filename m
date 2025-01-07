Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF72537E5
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jan 2025 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288724; cv=none; b=dGpOuMPH8aS9MqQXgzWZ+irKPfIuBlq6rLnh5S6mL7m2E8XKEuG4IxoMILcio+auk0GdkbyKAj25MVv72RgnCbn3FgnCxdUExvmb2PxYejTNXrxFkxe5M+fY50ooOOW18q5r1Er8g62NdRwBXJFJTMUZ7nt65IgAnc6czOZ+OMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288724; c=relaxed/simple;
	bh=JRe68iMl2zakLMJhBvGSoGehSpH/CvzFZOC9BIUDiKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdI4yeSnDMyVKTn6xxfjyEWOzzPLX3CAYedxUKH7OnQsAQaOt/HG5UrS2cWMz20YFKKdLoWtQfAiFANGec22jDGcgbHas9uspdQB4v1d8NWNTPxlIoyMhT8zHpYNRf+3eeWRxaxGIYyoYUKU9S+XU/jrOFtXtFRNKcxiTktztyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=PLQt6Jo8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="PLQt6Jo8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa66ead88b3so651377966b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jan 2025 14:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1736288721; x=1736893521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jebXeEDFLHZWLsVPGAcb7TpP0PKathazIKLPdL+8oSk=;
        b=PLQt6Jo8/s7geU9wXkoYAoTWWqNvp+IbMoYNmBCLGHAXWVtuuhZEaNNUblqyjAmwH5
         25u+X7SZ8SrEYHzdPR0Xl2NLZ+WItp/DJtd57pBemtgbh5stUPLAmHskTt9saJRIxuVk
         eKrmMyM+u6PA2Bftvu/walPToMCOoZJv4Eqi568PI7LinRnp5uuSehndwddHYyL1PgSU
         63YMCzdrtcPrFfYz2dKVwmRP61FLG4UE+wEzzbTVoMcfTMipIUDRnAyYEnUZ1lCGelP1
         n+JqGC1aOQCKojGv+6QIZh+0GuP8IBEa0e4PkLeKA5kVCMDBpyey7gbLQe5dORAxnpZv
         PCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288721; x=1736893521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jebXeEDFLHZWLsVPGAcb7TpP0PKathazIKLPdL+8oSk=;
        b=JyNQJOYP2WqYd23hFgFdBU9kSn+OKYLPW9ntsKhjq/B45ZhfNR3Jm9sBM2lta39VT4
         iiU7kZLbKjiZsdH8Tz1uLALRahSXE/6RacPWj4u3mYTA3OivLTjM99bd2wUYnPFEI+Qg
         8UZCaVtY+slChYOhbGHxwqSlE/3XgNLhwD4R4SvOnfJ/aDDp6sRg9CJCxmiGCDAiXYhw
         XO3S5362xWyFLUBzCvPodbj4J0t9r7uAKq9IEe1E0moPcjaiuwyXOjEqnwCTITuxNHzy
         Vv855ka2RU2bx3vdtOsUtohzzX7N7xXPQeHGvyi65zAze2TgmMJfvdq9WC/l1pYuyEdd
         Y7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2thjE0Wyakg0wAmtEAclgtMFnHBqMH2uRCXG0RstXhXlsom8rlR7fFG2uMi/BTQQ9LCqYqUHCvci5QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhoXDrMec5Fb+SYwyAxMNCKdWyC/WVSZlTY2YaviW9/SOMfXjH
	CXqofTonTpZfknEfEs8RcLCRDYVESZFgtN2aJKbsLQI7fPncH+OcSd9/WXQ4l9p5UKHiG7y1q9w
	Aavac8qpUEUMhtpHooo2Wf9mUjZuqwIeTnw1cdw==
X-Gm-Gg: ASbGncvGt9BArXtF9kgJ+I8+8KEFlzYoPqplOZYkwr58bILClJNCvTD3WeLXWy+UbKV
	yhaZw2TO+Qi6MT1oiMSK4Q6RVpkmfZjREGrZ9LhA=
X-Google-Smtp-Source: AGHT+IEgJFAiyTdXfRK6cbZEKJHy0vRHA1k7ND0TNpllo2zFYZCismOqNVTqdeMXAVMeTs/1sGgMDj5nfwWg4831vMs=
X-Received: by 2002:a17:907:97c6:b0:aaf:208:fd3f with SMTP id
 a640c23a62f3a-ab2ab558911mr38646666b.13.1736288720807; Tue, 07 Jan 2025
 14:25:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107114506.554589-1-alexey.klimov@linaro.org>
In-Reply-To: <20250107114506.554589-1-alexey.klimov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Tue, 7 Jan 2025 16:25:09 -0600
X-Gm-Features: AbW1kvbSWbAdq_71pzfVAMrLFakS1BUTMkkM4RIRLiEiZPH4nLytzBTzaeAxRjg
Message-ID: <CAKXuJqihpwnOTepgTkH3FaGB5=kXVCDOckPGpacJ7JWZXxsKWw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading and hwmon
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, broonie@kernel.org, lgirdwood@gmail.com, 
	krzysztof.kozlowski@linaro.org, perex@perex.cz, tiwai@suse.com, 
	jdelvare@suse.com, linux@roeck-us.net, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexey,
Thank you for this!

On Tue, Jan 7, 2025 at 5:45=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro.=
org> wrote:
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
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 195 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 195 insertions(+)
>
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index 47da5674d7c9..848a68bb4335 100644
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
> @@ -1367,6 +1413,141 @@ static struct snd_soc_dai_driver wsa883x_dais[] =
=3D {
>         },
>  };
>
> +
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
> +               *temp =3D wsa883x->temperature;
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
> +        * For example, before turning on Power Amplifier for the first
> +        * time, reading WSA884X_TEMP_DIN_MSB will always return 0.
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
883X_T1_TEMP))/(d2 - d1));
> +       range =3D WSA883X_HIGH_TEMP_THRESHOLD - WSA883X_LOW_TEMP_THRESHOL=
D;
> +       if (in_range(val, WSA883X_LOW_TEMP_THRESHOLD, range)) {
> +               wsa883x->temperature =3D val;
> +               *temp =3D val * 1000;
> +               ret =3D 0;
> +       } else
> +               ret =3D -EAGAIN;
> +
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
> @@ -1402,6 +1583,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>         wsa883x->sconfig.bps =3D 1;
>         wsa883x->sconfig.direction =3D SDW_DATA_DIR_RX;
>         wsa883x->sconfig.type =3D SDW_STREAM_PDM;
> +       mutex_init(&wsa883x->sp_lock);
>
>         /**
>          * Port map index starts with 0, however the data port for this c=
odec
> @@ -1424,6 +1606,19 @@ static int wsa883x_probe(struct sdw_slave *pdev,
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
> 2.47.1
>
>

I've tested this on my Thinkpad X13s which has the wsa883x, and here,
when idle, I see an entry, sdw:1:0:0217:0202:00:1 which shows ~26-28C
when idle, as well as sdw:1:0:0217:0202:00:2 which has ~22-24C when
idle, however if I play audio, both of them drop to 1C and do not move
from that while audio is playing.  Is this expected behaviour
currently?

(out of laziness to repeat what I am doing here - I have bottom
(https://github.com/clementtsang/bottom) running in 1 terminal, and
then in a second terminal I either play an audio file with
canbetrra-gtk-play or mpv a video with audio and for the entire time
that there is audio playback, the temperature sits at 1C.

-- steev
