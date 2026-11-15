Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794711057;
	b=Q4uovMjwnCLQJR37SssS+Pvv3Lv7GYPy8H0Ylbai1Bptn1hAzyjOpKaRYh17wFTQbIiZ
	 MHcMNqo50JuUMunNf8n5AiWl+/EPiLgoLCFSxlc90df4DZWOW3njTlUZ+Haxv9Kjhhf+8
	 lhWzllGeWlBMb7Iw0JQsiUpOsdtWgq+X57AQG0xBR3h83ooYTI/6jP/SXWheMUssWh7FL
	 bge2zHq6rcPAEGN80b6WD5rgNDTk89QY1+6kg/VQAJfhB0N+5QriGCmYsAmF0Zmv8GbmM
	 +a7Z8ob1aFF7mZrmJ6FRrTKoXN0CYJ39BtqJNdK0ORI19luPqV91jNaDKDhP6bal3Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
	b=MuBvSSB3pyaWCbBIYvPtYdFMcVNrOgN6wzxfF2V6txNrL8+J80P3topyunmgcGEo6IIi
	 cc/rLZzR7na85QDfebmynoXQde/7TLdIQy/GoHxaSiYbVB8zJXJout3z6WPIuMXJm43mu
	 UrLdsHHsvDSqJK7YFHx/BhvCm3o7PhhE+Z8c+i+AoKa0cgAPO4hL0mcGyKEbN4knJ1UpN
	 fAXXZrYcKxdsGalmKXA4DEEuKPaPt9JLl9Pz4+EqruvqHrY9KRADob9o++RnZkNwLQJVu
	 XYY59UYfHEPb58a/VxbBu/krof1E7NbGuK65uwYxTJY+E3/kTnVQwJ0PWNn7gyrmkoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B42606A329
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 02:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B42606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ada7d53082so32357001fa.0
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 18:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794711056; cv=none;
        d=google.com; s=arc-20260327;
        b=kfz0u+0KowSJIA6LRsriH5w2eKXNbJYgjEl+HvASdfQRk4ybO8/uVD9V1Do/IPjf1D
         MCdSh8yA9By4j683ZhumvLbRE4kmm6FqJD68qTUCtlpKn+RfA/Eqot2i0XRH5kNyfR6g
         5i0bZinEun6jyV4gzNQFb2dZsF0ab3orfymerAKLODOx0hC9/qIp7/KlFxQveKNVI9x4
         dA6mzegNCZVGJWq4VVQF2tPP8XWlt8PFnAsLFBKncUyFmpAI8YiWBOIpW1+lHQY/ejEZ
         UhpllOJlupMew8a5RRgVwpEw3SXUvXyZT7oE+aOH9E3Fu7n38XPNv1v81kudBvRzZmWS
         IOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        fh=o3ZvmUhMhlmMcncmKWdrkNPdmT1mD7n20OkWN0dIvRk=;
        b=eG/1MieFwovJyLZBjrO/bc+tferB7wbtaDti7KImdbg3ndF35aCIHyw+MemQbF7lQI
         Fnsj/k2OoPuBtm4/mC1nmfw2HGKyiLTcRSbGyTue4t8y1Se/hqbtJ03rxircVSRPGeZ1
         PeOA/vEGs6c13QoE65fjTDx0v4jfiO7Mmql43H61BlyEjgy9XRUgPGmNZSvSx+x8oGjz
         Reo9TuI8+EzhsYyBUZrI+cTNa/uV77uLv39aokM3jNd7n9VAG2QdAytckLlLi2kH3Kkk
         0jSGQq6U8NIbQsU0AA0PqSfKqPIVl6UJplb37nxw/VDFQcmtXyPt1lH7L/gDA1NfUkl2
         uY2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711056; x=1795315856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=C3YL84B5AdvG1vULn8iIHu0VOFFhm8wHMS7GIQReErW5xay/xayGeFR2v08rTSLBHg
         s0D5TfL77gY8I94LYeTsFZ992NL+FrL0HWYEWfoEgohVgSQWYiMOJI1Q0gXgjnELGusG
         yxGe1vxxfx5tEGjZ42nNjhQFu17xAWNFif3Zt759/IlE1SQWPCM5e2ohCHekYZ4bsB1V
         n3pG0iYYk3h1AJhj2x4Ieuyy4fcS5ftmtqComvfDS76iK4MnePo4uty6tbbuhU6daKVT
         rxRNMxf1URagtGlMtyv0/DBqu6w02chfXl3qI1cxbSPefPUuGOIIT8LkwnouANQ+pQk6
         B1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711056; x=1795315856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=BCk1J8u5ws76Tbpexr0/cScQhekNrm7FQEdwv7IhYnjm/M3GMdKgH1dOmrNXfPMDCF
         5yv/giZsfHle01Tgw8K66LzUQ567olK0u4xjTbYq4iPewKXHQUu+082+0MePScWcTwom
         nREE5J+OQ7UPUZmd4/0JGTmN5CzYbBebUPWMHCIe0tvzeEV1J9VuJnSFopB26HBQfjLt
         JMuwkmBkFF/DkFWyaukHitObaFSAeXv09hahFhxuoEs4HjEeZmvusFFmgS9MT5jinMiU
         wQK3p+OurYbCH8xjg2Je8f3V8+F4UMN1y5qI28T5TiE7vHiXkhB3gX9cgatvVUCLtX5A
         Qz9g==
X-Forwarded-Encrypted: i=1; AL+hErHGtmtMrasIxz2BrkKS40Ec/kICLM2dRRYR1dCWxMXI7yOdhzVpH6OY7Vunh8YstbOldVE0LEX2ntqsoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+I9t5U704RJs4SHv4m26zwXZRzaDUgluUzPDKIX+z19KV3lwr8
	2g/Qx9Jhl12kRqhkFDoK+rnZyKVxC5NNAaudWjknPn+clr8tuunXr4XMDoxK/ED3e41hq5epcGw
	E0f+DspC39Kp4DJjr29flDCPw23SHIIY=
X-Gm-Gg: AYBFou2fOjaWv1Urp6GOGeH6r6dmiZZouv2K/oobNsDOD/3cmR9rqslfoCbBw8Qr7U+
	2ygKRFNMZtIa2706XQcVYdO1t7jb5lAg069D3/9xmV8RVEi0MNugMg3ah363lEApVGyDdYpQYLP
	bhbgJwMReGNUcvOs6SwzuqzFW9ES1IysApymXfjRNvTGt8Neqw+l+35nlgLLGmijP6yie6cFAbM
	vL3dOKtacznYnwsxzZOqdUoENIn1yO1FM5c6mD5zZjzpfIwnjL0rkCSZfUo9aWqZa1aWOFytrYB
	QQasp8oCPZf1vO+Pmh3Us2gStBQay4DxH/U79Pszb7XJK/+qvGQgp1brSU3jPnpsKLKoTWXEuXV
	uBo9HmP6ySwzlGNTSVdqOV02DAqp8JAEM1q3BioWqX7+OWIK7eVVipDy9hy0twKXXGBAigCCVhn
	pJtzMG0jBGR9fdit3n3Lrmq6aH8BNRii6ZPAQP85WObA==
X-Received: by 2002:a2e:9a14:0:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3ae2b5244eemr16617881fa.12.1794711055318; Sat, 14 Nov 2026
 18:50:55 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com> <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
In-Reply-To: <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:50:43 -0500
X-Gm-Features: AclHuK-sqqPXlIQFX4lO3FN1NrvQTjfvTZhocvr9YoyjI16C5qy2nZEmwXZkKgs
Message-ID: <CAEdQ38GEckm8oU9pmg_t-_EC85brP4ghWAE4tYBNEvF+gcqMKA@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:00=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>> +``temp[1-*]_max_alarm``     Sensor is in the warning or fault state
>
> "fault": Sensor is broken.
> "max_alarm": Temperature is too high.
>
> That is distincly different. A faulty sensor should not be reported
> as "temperature too high".

My wording was the problem here, sorry. "Fault" was my name for what
the firmware calls the Failure state, and it does not mean the sensor is
broken. The AlphaServer Management Utility user guide [1] (section 3.16)
says the firmware keeps a warning limit and a failure limit for each
fan, voltage and temperature sensor, and puts the sensor in the Warning
or Failure state when a reading meets or exceeds the matching limit.
The status byte in the console's packet only says OK, Warning, Failure,
Unknown or Not present (Table B-1 of the same guide), so a broken
sensor cannot be told apart from a bad reading at all.

For temperatures, v2 reports Warning as temp_max_alarm and Failure as
temp_max_alarm plus temp_crit_alarm, with temp_max and temp_crit being
the warning and failure limits. Nothing is reported as a fault.

>> +``fan[1-*]_min_alarm``      Fan is in the warning or fault state
>
> This is wrong since there is also a separate fault attribute,
> and "fault" means defective, not "speed too low".

A fan in the Failure state has slowed to its failure limit, and the
firmware treats it as a failed fan (a drawer is powered off for having
too few running fans). v2 reports Warning as fan_min_alarm and Failure
as fan_min_alarm plus fan_fault. If you would rather keep fan_fault for
something else, I can report Failure as fan_min_alarm only, but then
nothing in sysfs separates a slow fan from a stopped one.

>> +``in[0-*]_alarm``           Sensor is in the warning or fault state
>
> Which one is it ? Is it distinct ? A "fault" means
> that the hardware is broken/defective. An alarm means that
> the voltage is too high or too low. A faulty channel
> should not be reported as alarm but as fault.

It is always the voltage being out of range: Warning is the reading
outside the warning limits (5% from nominal), Failure outside the
failure limits (10%). Both are reported as in_alarm in v2. The limits
are not in the console's packet, so they are not exported.

>> +``power[1-*]_alarm``        Power supply is in the warning or fault sta=
te
>
> "power" is supposed to report the system power, not
> a "power supply warning or fault state". If there is
> nothing else, this should be identical to the matching
> inX_alarm and/or inX_fault attribute.

There is nothing else: the firmware reports a supply only as OK or
Failure, with no reading. Failure means the supply itself has failed
(lost AC, power not OK, supply fail, over temperature or fan), so v2
reports each supply as an in channel with only in_fault and in_label.

I'll send v2 tomorrow.

Thanks a bunch for the review!
Matt

[1] https://ftp.zx.net.nz/pub/archive/ftp.digital.com/pub/DEC/Alpha/firmwar=
e/interim/ams/releases/Version_5_2_0/ams-user-guide.pdf
