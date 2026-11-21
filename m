Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292721;
	b=eTr9s7NXLN9yG7vkfA2jMzJwsTTL47tvOeR1BgUkbLny2LQb19JNnBtrFX1YJbU5ZfjT
	 2v7O7CIzP8+DpqcetFqN1lhorfaL1NRltB37iSRZDV2S9s/UgRKusU7yfeloTB6ExG5k0
	 +isXyQKzdyN55J3E2qfZ/JGSOILKGWGbcmaJ7YyRTECdy7wn2yp/JzBHnlIRGL+WOTyqK
	 kP+yEpob4vt2j8hy5L4ssXwYdECsfLEWlf2R74TbOqb2hKYbHS+JPJ/6fyWYprp9s8WCp
	 qSESj4KLGn2cRDYEyDBB1AlQKUrPM47hb7HpPI7/t3BTVse+sh8NV7Txt7Xo9JBxR9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292721;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=FlZD16XOXzpBlGeSpCzFFK87s1nxhxjAOKNSrws2Kh8=;
	b=SNmo+B9Y6Goj5TVMj8KgOdT3iNY4DDK09RpN8Z4wt9DtyxMKnqFGG+1s+evem80y6VdA
	 U1ojwaPKk6LXCUpslM6HOxU7U1axwfM/8FDYvK6sBIiS/Yn7KqAWBNsBuEs6zsXEKUc3A
	 FJyLdMIPVER2SuOgOtioz3j5b9hM7M3LBAczk1jJdjTBZg2qpp+MwcVV8fHpH2oqBvToi
	 pW7oF1Ny/Eo9nDXTBetK9d7K071e7zKw953M9+MR+alw4jWV/1R83s1ucYaknwsTKRNko
	 7RCfCe0X2p++VKtNHIeWQ/4d7Y6RXf6NvUKTGmrNbXMQ1TJDPklYhItW5094ZYE1PcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="EBmVh/QH";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D83606A320
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 20:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D83606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=EBmVh/QH
DKIM2-Signature:  i=1; m=1; t=1795292717;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:ILN46iZLYtu7RE/+jX5nh+pfLuPv
   1UwOF6ETW2awCTAYG4b0V7nWr+Vhh6+s5m+uqpTnCzClYYT+Glr9u2silmqe7MMHU74bV9XqxWr
   VRHHwWBMdk68km3NmYYtZ0S8Su36zuJ2q+7Cq8t8iDc5unvGGNDTZK/Jq75RJFSGhzegWiCEC+Q
   ezP5MrHn053/y7Q+AuBR1Xw3vKt21D8d3GISk3EGZ/zI7/6rSvOfPDDjp0Pe1zbs1mTSEyaU0bI
   zZDxLZq70UdGwyU+zqRCLO59ElMhivjqtb2G0nwg/CRE0cfmVOPXmGYCqMhCCdnlttXBXrnhed6
   jinuzxBOrWRA2g==;
Message-Instance:  m=1;
 h=sha256:
   iKwMvcTetfZDme+27PeFO0vJhRwW0WWySi0vN2R1Y+8=:
   bypAxPXAhLwgVnKIzNi21/TsgWarp5O7LwH6ybLI174=,
  sha512:
   2+h5vkW9GsQ+cDUwSY8AzJKNLXUYx4I8gjxI39JFB75SluCm4xDooBuUX88BKfC+TCcZD2PhnscoNMLGHwUBtg==:
   km8FLW5QHhfldcUtMqJrBQIFRGv0lwLiDUJVoZL4ysC1C11txk6/rF5rJgoGy5q/PcAk6iyeqeiPEqm3hnJAKQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795292717; x=1795897517; i=w_armin@gmx.de;
	bh=FlZD16XOXzpBlGeSpCzFFK87s1nxhxjAOKNSrws2Kh8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EBmVh/QH+Igf9bMJM9V54/qw3H7PFta+TqCYnzQzHXru5TbRSH8VHD4i2+AGF1Fs
	 y//GTuxIwQg/pbZi3B333MUfzvHoAs9UaO1KJ5OovwcdJP/aZya9DE04oM5fFqUvg
	 Ry32Armb/hZuGGNSGdD0brD3riHVUH/azLmLL1F2J5zgdgWYOrtPQLAPUWS9jrACI
	 WuWWiPsRbZb/MfxqtRWaql1+doTv7RPI70URCSb6zUMDyLZz/df4sFFzzeqffJ5bs
	 QSqMn1SyscL4NlrcLKCZMWL7/puEWdLFYxH7nAhMq/2WH5bJHIQWcD6pFahsCmWWQ
	 SRcMuKsKXq+XqkQWeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sn1-1ycADK23CR-00rXnL; Sat, 21
 Nov 2026 21:25:17 +0100
Message-ID: <79f7bfaa-1cd0-4d44-818a-f080cf0168c5@gmx.de>
Date: Sat, 21 Nov 2026 21:25:12 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
To: Ivan Popovych <ivan@ipvych.com>, linux-kernel@vger.kernel.org
Cc: pali@kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20261121193227.9408-1-ivan@ipvych.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261121193227.9408-1-ivan@ipvych.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kr0E23JFqzSxbAlTNOXiCOgLQxS6KjYknRopma95FvUD1NsA7Bc
 Jt5VR2Ip5GkdPYXH6Fh1rGvdFvnkxrkUcy170XWS0pe1R0vJI5owCcBTY/giY5UBHKXOHkg
 QhvLkSp/iSG3MKL2zDZYKDkXA1GJxuy9JeZsFaOKf8vxWQArTD5sShfmElyRjqSwWS2N+WW
 r7kzPsIMFbpjG5o8+0C7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MJgSmBMdozE=;jszdxBcvwbr2waAKJ8vZU8zmOCs
 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

Am 21.11.26 um 20:32 schrieb Ivan Popovych:

> Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
> running "echo 1 > pwm1_enable" disables automatic fan control and
> "echo 2 > pwm1_enable" enables it back.

Hi,

can you check if the 30a3/31a3 pair also works?

Thanks,
Armin Wolf

> Signed-off-by: Ivan Popovych <ivan@ipvych.com>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 5963f908972f..ba189b086b22 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1640,6 +1640,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>   		},
>   		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>   	},
> +	{
> +		.ident = "Dell XPS 15 9550",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> +	},
>   	{
>   		.ident = "Dell Optiplex 7000",
>   		.matches = {
