Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233575;
	b=WyJlkGH7uOrsfM4Sfs5QhFyPQFCII4VCVc3mCnWi1PuSvDlYTG1UEk47eacwAw3OWdxF
	 YAJK11Z/K/LzTBQn6/AVXH9h4/mbvtrfh13QzfXknvoMLzX9EKf29yZFtRTn4LXqcC8yk
	 55fr34O8H4Khy5pPzuN1nTWZv2XJ+GyDGTjZFHtCXlwDwoseh7JZaTFkmaxahdlqRnSUm
	 tiLSYXnyN0LaAJuRW/KFJp0ia8WlHNQM4x0S6Ra4gOqAgRXKFDeh4l4Wfc6csU4B+Jf1P
	 Y6AkJ6sgcg7Ox8Vp5PONUzPXWxtMizBcGVHlFhTo3jwDzKK6DlDpHN1BPrqw/ltwDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
	b=jmogvuE+xoLohNTXr3JIxCkmToehHWhyj3nCeHmtDnUXSeIlWKfeETh93E2UlrBDolUv
	 VTb8pqGA4N7Ws0fQV3wfSEaz+0Teqle/qFpxrRl4NL0y8UhEW7qCG0ioxUQ44FoVO9uDP
	 94i/YQ9JyZ3iaibICIldHTdUxQlncR2mTFmquynpaZNujgRzCdYo+PizcFJVs9wNnPZxg
	 uexZTPPIhdY6BISndEaCmrxmiosfWDcawxdWYghNZvPvIHum7jMzJkW5KLHnhEc4PjvYi
	 NkMN736PVIl7o33eDZBc6GVOeiklLT6uSa4tXq4NmzJkoK6XI8Qmv+6udrM9cnyLuGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIj4n5n1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4B606D809
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F4B606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIj4n5n1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF1xI022493
	for <linux-hwmon@vger.kernel.org>; Mon, 9 Nov 2026 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=; b=b7bf1Oh7IQsoIVX6
	A9bTlRfFlN9+11ut6kbR4bLZ+BEtSBQC3OSJAQfj9nm2dB2OUIo77CYvyRPW1KSo
	8/JG2XtlngOsTyqDAX9UQAHSoNSr3gz0i20O5d1+iBHYN6POSI1CBtVt2JPEh6E8
	vwrnnHFribo92Td0weaceLKPykVdboLdEku5RxJVlNSsGIqctv5e8RNEWKFZNtwj
	M5y5ytR9Z9ES+FmEaHz1wb/1x5xjSg5v9nRUIkDBxBlt+1kOGmKTBor9WdblJHnE
	kc9sa27v3xN4SL8p9UHqrpjHOtUxanaX5fW7YHlYmddU7GuJG58u2128nXwJTHr9
	g4Kdbw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgng0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 14:12:54 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc081f3066so27911137.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233574; x=1794838374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=aIj4n5n17YGmIldUWt0Yx6INE98pNRj8L1bQsSJJzU0hGSgcFIIsGgBaab9i/BbcG4
         PB3XEdpYqAZm7g8QeD9CSM/fph72qy4DOPxfuOa12BIzTvzNw+LY7zwFaAYOSLK4lmjL
         bs1gZyfbOMxlgCEpeThJK5Py+uSROyCYqlqhHVFBFbxKAftU5SGxM09GwJXLdGfbDNRM
         3re1j11rw3JAKu2zIjp7o0NQvPwc18q8sHWs0O3D4PhaiXAdMEmv7Dv99xumKmOgMfFC
         DjV9VewoRFdeHVc8chqbrF5T8vLj+9sJthNkhfM5ejvgY6UK+oU8yyjYScKUsDY82JAd
         +tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233574; x=1794838374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=AL2vIHGM83TX+M4IQCdspCPfBtxMiwnCOq0/vmrUL78LQ7cKCMGwu0PicPB8ptGfJ1
         MF4L22W+USZZ9/p2zgSPuxF9AnKhmE5MOTHmJTQp8lzfvAvvvlQpss0ZiPgzQ4+s0mQQ
         xkqUHXiW1puTwuLyy+X2dE/viT/O8/XIkd4H4aS53uhZSNZ/QnBqlMjOxm+iNjAR5qgf
         jmccVzNtqA1MftgweBdPr/mbFBT0Rq+wvZLCtR2s0pmL/U6rshOm4b6FyvbYsm0hkaZL
         uNIxdRz8JrBEfVFErUY1UZngIeycSiqN4bwpn03bxvDrwlXf6bsAtsmdPxQOi80Vfuq4
         9Nkg==
X-Forwarded-Encrypted: i=1; AL+hErHNDnXiDv5ko4Et1JDfJI5/t12GHxEnqIqYpGIF7cIrEsdWZAGMCkM805OAj2gW8TrmRGUScvXVn238Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EcFzvcWmj5WdvIFcmhLzE8f/eTklAIk72LuRTHh9sXb0AMygY
	InWkVGPQx1FSOYte13WKFo+tItPSDdyc1TzYibPd1d2izzBmLPIai3KNtK5lgTG9TEIHp80CQ0a
	xcCiUCxNkPE851gE64PPBUvMIH9PLjqpeGOujkrbzDvfCkn4f0uqwIrsPb9WwVGZBK6XA7iznTQ
	==
X-Gm-Gg: AYBFou1o7spKSAgGLH9XIsjBSSETtOPexFQTWIdn5eBgyxCUlFsJLtKOaPQj3l73bHn
	dhJ+FKxwg8vO5zVKJ1j4zqngXExA/ov14bzCiA3PwGey+VYaudPFjeYrBEe93YMNQZp+uacihWg
	+PgBDOjoBexTKA+zLqG/pAB1pGFp2cBDQqPlwReRvUssnIlsfheaUIdwwbP4+TZ8BM3LG25nnSL
	Boqg8nBSv2fC28qYCFWjYk1a0iEnEqWUf0bc67K1NcZeDzF1pnYLQbzu6hF1hDvZbis2BP6JsyL
	rtZYlVjEJqGAUqJS4FB1NBO1yo+9nOBArlhWdhd0H3SRgkMeM03ZRdMerNBFmnjo6Wh4nXemtD9
	ueKV4aUu6QOr5csEMlwhsFjK1TWy4eJtBoHAvGOIJKpk6ncfvLeySexbrmGvdBtDcFBrOAw==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982150137.3.1794233573671;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982104137.3.1794233573125;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm1736102a12.8.2026.11.09.06.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:52 -0800 (PST)
Message-ID: <08a43e54-6f54-489d-9ba7-6cfc6eb173c4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:12:49 +0100
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
Subject: Re: [PATCH 2/2] platform: arm64: Add HP OmniBook 5 16 embedded
 controller driver
To: Rahul Pon <theflyingrahul@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
 <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX4599W8DO/pQH
 0AsMF1hEKiuUXfMvC9nkd+nrXlaFT2uYutUjmRfbHnC4ow+aaztz+j56Qj64j99MslpCClzqxOg
 GKMiO1vha+/kCnBoTq3kL7dzLyQ82fI=
X-Proofpoint-GUID: s3ouBLtgs8z3ChbJX8Kcsw5hnBCtAP2a
X-Proofpoint-ORIG-GUID: s3ouBLtgs8z3ChbJX8Kcsw5hnBCtAP2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX/AF81wAbuc4e
 4RhDV5OI4r/F3oS/GRkFTT2FFzoZMft2FtEopqR96lVT62srPH1PEUfQSMrvrLiu29ovWCzqVem
 XptMFMH5Ymnq91wxGc3Pk9bottLt0qXWKpQH2cTQi1uJ618W5HP6/aShuDTcqsFJ4322b5M+MgH
 rNsxzPfED7VQkC1k3jL3Gp/VxAuHUt1P20Og2yJs8Cap+RVCohpVHNbK34qa/TW1pUXkkl3vmL5
 gtPUoEiE+VzvF8xCp11ocswLhsylRfGkvjfK9jNOObHXOmkAPNuoTcGlIm9FQ5t21MOXoIwrcEh
 YeQTRIroEBmQjoPTkh6JOYR4d6hgEdas2Q14ZhMx26dyfkFn0Fgvtr8YYCy1riBr8rqDlr23+QX
 wbr7ILkJ6bJllQdut8FJekUX4/KDaJQ0hsV5sk3WVBiVL5ye5PghqbEKwgDICxNgBTjzvw7FxKz
 ml9Qj9F6wdTvwpYDquw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d4e6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=0yDvZPlJ0jkY2xphDlwA:9 a=QEXdDO2ut3YA:10 a=KfD-mh6vjfoA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090056

On 11/9/26 11:49 AM, Rahul Pon wrote:
> The embedded controller of the HP OmniBook 5 16 (Snapdragon X2) sits on
> I2C at address 0x76 and takes commands through a mailbox: wait for an
> idle status (0xef), write the command and sub-command (0xed), wait for
> completion, then read the 32-byte reply (0xee). Its interrupt line
> signals events, read from register 0x00 and acknowledged by writing 0
> back, as HP's ACPI does.

[...]

> +What:		/sys/bus/i2c/devices/<bus>-0076/kbd_backlight_level
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Rahul Pon <theflyingrahul@gmail.com>
> +Description:
> +		(RO) The keyboard backlight level of the HP OmniBook 5 16:
> +		0 (off), 1 or 2. Only the backlight key changes it, inside the
> +		embedded controller. The attribute is notified when the EC
> +		reports a change.

That's already reported in <led_subdevice_path>/brightness

[...]


> +static enum led_brightness hpec_led_get(struct led_classdev *cdev)
> +{
> +	struct hpec_led *led = container_of(cdev, struct hpec_led, cdev);
> +	u8 reply[HPEC_REPLY_LEN];
> +
> +	if (hpec_command(led->ec, HPEC_LED, HPEC_LED_GET, reply))
> +		return LED_OFF;
> +
> +	return (reply[1] >> (led->index - hpec_leds[0].index)) & 1;

"& 1" -> "& BIT(0)"

Konrad
