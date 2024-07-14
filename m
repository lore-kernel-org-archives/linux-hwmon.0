Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8203C3715E
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720951331; cv=none; b=gXFMoDiaPZK8FH1o2IvRg5/bIUzT8o7JU7fq9kvVW3qjFnRNOf7JqJS2co+Xa+VZq6BnGPcwedLtTTUQRiXzXiT959/Shj6fpFALBh6Y3cM5azpvnOyf15FJ9tudFW6nwtQMB829e8n3PFx2aad3jA3unc/uUQx8CMOah9oKhiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720951331; c=relaxed/simple;
	bh=LoQ1NV0AS/TBbcmI8ui4ganNiMDBc39jVgfhte1N7+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Yi1YlTVzYUlBDvR78XpYu85SRbZMhM/22pIUm/YemCaOjUPSdQoTmt932/3mGNWbCK0IFMypOAL6PEvHF5SUmlTffgAzh0JfH2WUWBxO3s1hBAwapevr4lVX325xU60QoLR0d78WS7JPXQcCO7/9t1n1VJUe7rD5h2mO/8Yrxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPQV+1UU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPQV+1UU"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso4004445e87.2
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720951328; x=1721556128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYgeQV2LhMyh4iRG/9jc8OV5gHewFcWWgn9rMk1HTHg=;
        b=LPQV+1UUL405wf51avmiAgzO8tISwARQF5MURhPc2ZnQaeqFHhsTnRaQyVViN8nqIa
         9hlG4/PVwznd6nC0ZpwDul1tNTyaNvgI4ldz4MOvcd7tU1T3I5bGd2HpsIgrXNvQOeii
         V6optMTSHDQ29G2X3CX2ZAV5JRSRf26c7QqVwGg7aByOjrFu4fO+CWDTri+qdiuSCRo4
         caIeNfl8bO3v3ZZGDHMQsHcKbZJ0v1BjemveJk6UOUyNMQFigiN7gowCNMUZwSknv27p
         ss2qlYm5ggRTTxg2RFCEkT41mnDUotFrWy0C+PcyTD1VNzFpOrHTobbhK7/Sc59b6A8r
         AkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720951328; x=1721556128;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYgeQV2LhMyh4iRG/9jc8OV5gHewFcWWgn9rMk1HTHg=;
        b=GUlt8WWfxX+cHhUZJJDtMBpaAZlROfJnb04Xqp3qNEkaAsmGjrBK7Zf1UX1BEweAzf
         70XhWtZsPI1IGV4YntKVSGMPsZ4UQmW1DC40ZAhYjvobGBUiYVP948jJK+sA2Va61YHC
         uPY/2JL04OAsBIYweinmhfSII/cxVLYPrwou2wTRhDFSW/aJPjiSJo3YImAk/Y14O6vk
         scf7olsA6YifRPV3vtusJ2ZAi82CGC/aszy0FZZY61ZS1dQxLb5IpCrQKe0ss5jHe6H2
         J273axvjcefGNTot9GZy+IrJzhvhYakyy7IqNVUJUwm0lDXWaPBhfVVdEgkV/Ui84bQn
         tyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyp2gcKUsreB15kYqnJYXBWMhWOvk2n0+AFHWJGyikjCLFx+wFFFTnUfT6GD0cOBOUXkdnF+B5UkSyJQxE3J8nqldEYj6tBayJSbI=
X-Gm-Message-State: AOJu0Yyr/o4AwB81QoSx6l+aqdY7R19dpw0668aGLkzIAZX6/wrIjdlf
	0opGUIBsvhKiONwkNRY4VZOXIp6nzxXb9qzfkRZfA2sPC0ETtxPwU9aQ+5h21w8=
X-Google-Smtp-Source: AGHT+IE5kwo/7XpsPKWzwLfc0V7K6RUtxJa57vwpzUyE+Htdkgo+yctfMTkbVdX91AHSYnyjzWsYbw==
X-Received: by 2002:a05:6512:3d21:b0:52c:ddc0:7a03 with SMTP id 2adb3069b0e04-52eb99d1feamr11639972e87.55.1720951327580;
        Sun, 14 Jul 2024 03:02:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d759sm430106e87.128.2024.07.14.03.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 03:02:06 -0700 (PDT)
Message-ID: <fd09fa44-1795-43a1-ba8d-ca2ba8f71d07@linaro.org>
Date: Sun, 14 Jul 2024 12:02:03 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wsa884x: Implement temperature reading
 and hwmon
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20240713095635.23201-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240713095635.23201-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2024 11:56, Krzysztof Kozlowski wrote:
> Read temperature of the speaker and expose it via hwmon interface, which
> will be later used during calibration of speaker protection algorithms.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Add missing dependency on HWMON for y!=m builds (kernel test robot
>    report: undefined reference to
>    `devm_hwmon_device_register_with_info').
> ---
>  sound/soc/codecs/Kconfig   |   1 +
>  sound/soc/codecs/wsa884x.c | 197 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 198 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 97bb69c9848d..09a0b209bc2f 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2447,6 +2447,7 @@ config SND_SOC_WSA883X
>  config SND_SOC_WSA884X
>  	tristate "WSA884X Codec"
>  	depends on SOUNDWIRE
> +	depends on HWMON || !HWMON

Eh, now I got build report that hwmon does not have stubs for !HWMON (by
design or missing?), so this still has compile failures.

I think we should have (devm_)hwmon_device_register_with_info() stubs
for drivers not depending on hwmon, so I will propose a patch for that.
If that approach is accepted, no changes should be needed in this
wsa884x v2 patchset.

Best regards,
Krzysztof

