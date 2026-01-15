Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CA53D76
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 00:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436194; cv=none; b=ETAgCNPeIxwqLCYX7sh+FAreXJZ6Ju5QdC9NbT3NbiXlvGM+1Top0FnAEHrKMrrTT2VD8ktSKF6tDU/qNtNBHOFTvBCvkNP/PuTQEHj8XvdHq0mejIKNNm+vqETVbKoH7IGYu9lv+dslJFt7kVo5dO9B13RmvW6DIGKTo/+GtaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436194; c=relaxed/simple;
	bh=88YVk0Arse2X4YXQXNzA92NXyrRoskw+Ttj51E1gjcw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F82PQcEYXnpxiUyrJ1b6K9N2t9+El3u/6fXEbIra85Ror6575x7V7c6VUbSJ2s65qobRlyS2y2Dly7r8wDHbUwO0kXjHNNBkdD4QI0gwP65fke85Ba8RYXGZN5ib6lcHKDrQllqoJ3yBHFIqE3cXHLT7lQbI4e/O17fMbvEXOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxT775v8; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxT775v8"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5636784883bso334097e0c.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 16:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768436192; x=1769040992; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fEHHY+TTyFzggbhkRQjVOIOgLGb+TehajDMunOamqk=;
        b=NxT775v8ZaSaGbMuTJZ8yoEddM1hkyI7bdUlITPeMjqdARiOnl6DEnkEAb/pt7eEbv
         Pt64TLYV/WtQitVhPloD/Abg3iJy/XuP+xHLHOy/ordv7ehr56JGo5XTc56y6T91AXfG
         lpAxAww4t+JNhCyK9+QVCK+TWi8itscbUREo8emCc+WoauWD9+DJBHlo2du0bm0yEywF
         pweipN46mQ1p8oNl4IkIA7cSW+B+dz+YUm02YcEdhCbLRgJhZ0JvfM7VIkJZN5nrEdkw
         /3SE+fkHWhMaRqWDgFDFM0FGAUmSv3kYzvNIKqHmopXzToYeuJPpGWNTI562cmTZEDXM
         vgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768436192; x=1769040992;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fEHHY+TTyFzggbhkRQjVOIOgLGb+TehajDMunOamqk=;
        b=vBYE+YqID/vzTLRP/J07Hz58bpDzPiW6MYc6E1s5IsgXAz6th7N/DSIwI9W2klARep
         pRnGm5xyKsFcFreWRTQChXVzY7s8SIz6DsZAZQl3L0dm2aVXuz3lNvCHeYS4eT2Zohp8
         moct4yh0nX8UnoFbfk/XTVTFzTbvhGwrYX6RYgIjQARQRbjH1g2a564SScd6t3zJLKJg
         XXat7RqyUL/H9TBhCX/nKhPacFRAdqBGN8UkNRqLEiTQZiEM3vxmMyFADH/WmxCPv+MI
         duVj3cQ/QwKvNddIsrPBrpR9ejj0GLYRfASE15pSlQwFGUkYNqXK/0ujwRCe7N4SUIgv
         mPHw==
X-Forwarded-Encrypted: i=1; AJvYcCVUfBLRw4W5+g4vxGu4EbE9TsunEv7crQijzB7xwf9TlRTx+SgO8vl8q+02csnoDpkZMh2yHTA+/Pw6mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jSKsYJsAGwHG/sCVVI+zd/fuhCgL0rWhJuY3RJGA/tQ41Pqt
	vHXOVbkJdfilgzhDd2V50877r+4QVa9DNicC/mo6/jv2BHSVcXBCudC8
X-Gm-Gg: AY/fxX7d7dYNKBriwRlvpRLpioH0oBbfyIuB5/xw2mFxZK05lCFXGIhC+jtf2DXz0Rt
	hmhX+SrhgGDSdl5jDTQoGt6W9j4Yjsnvdtgza9yl2p4xtpDuqYaiNyqj2X/xXokBcfM+ik7r/d7
	+EqUEwLH/mGSNxKWqCRXpeX5bihu3OcVhuM3hqLiApEUiPXZpoWQKgl87wd+rt/535kguoX1U0s
	Va2IgBnRw5yfRamkkod4ZLAYjlqQBypbU5PorvIxH9h9ppCURlqC+NKUqbEWTuIc0ICTaZVdDHN
	+klRVhoyyYHyB+iHSqTSc6OcQUSDAuRDrXffmJG0Tr8pwALDqv6T8lmhdcX0+yk1psucJeL2AKY
	as4KJXvoTZxekJiN9Ht1FDoQLzv90FgR3aZas1ofSwGGp2NZKU5Q6dsTRz9QH77Z3YbM8d69x36
	JJ+sV+/F8=
X-Received: by 2002:a05:6122:d0d:b0:55a:e007:4c7e with SMTP id 71dfb90a1353d-563a093a35dmr2171478e0c.6.1768436192247;
        Wed, 14 Jan 2026 16:16:32 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563618ff8d5sm19216082e0c.7.2026.01.14.16.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 16:16:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 19:16:30 -0500
Message-Id: <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rong Zhang" <i@rong.moe>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, "Armin Wolf"
 <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260114122745.986699-1-i@rong.moe>
 <20260114122745.986699-8-i@rong.moe>
In-Reply-To: <20260114122745.986699-8-i@rong.moe>

Hi Rong,

On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
> Register an HWMON device for fan reporting/tuning according to
> Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provided
> by lenovo-wmi-capdata. The corresponding HWMON nodes are:
>
>  - fanX_enable: enable/disable the fan (tunable)
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable)
>
> Information from capdata00 and capdata_fan are used to control the
> visibility and constraints of HWMON attributes. Fan info from capdata00
> is collected on bind, while fan info from capdata_fan is collected in a
> callback. Once all fan info is collected, register the HWMON device.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---

...

> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index 821282e07d93c..bd1d733ff286d 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -31,6 +31,8 @@ under the following path:
> =20
>    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>=
/
> =20
> +Additionally, this driver also exports attributes to HWMON.
> +
>  LENOVO_CAPABILITY_DATA_00
>  -------------------------
> =20
> @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
>  The LENOVO_CAPABILITY_DATA_00 interface provides various information tha=
t
>  does not rely on the gamezone thermal mode.
> =20
> +The following HWMON attributes are implemented:
> + - fanX_enable: enable/disable the fan (tunable)

I was testing this series and I'm a bit confused about fanX_enable.

Judging by this comment and also by taking a quick look at the code, it
looks like writting 0 to this attribute disables the fan.

This is however (per hwmon ABI documentation [1]) not how this attribute
should work. IIUC, it is intended for devices which can disable the fan
sensor, not the actual fan.

I fail to see how this feature is useful and I also find it dangerous
for this to be exposed by default, considering the same could be
achieved with the relaxed module parameter, which at least tells the
user to be careful.

Apologies if I missed some previous discussion on this.

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/ABI/tes=
ting/sysfs-class-hwmon#L279

--=20
Thanks,
 ~ Kurt
