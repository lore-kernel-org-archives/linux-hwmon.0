Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793143327;
	b=xrkpPA71MZRxvmUc+gzm67VGo0EHcaLcnCWqi8uWdS2RYfFw+no/KaTUM0/DsMcirvh0
	 I/X+lbCtFPeLVMfhd1bTDH/1wJs428SkLv9QtriY2l9zTXaHiqx89vzPuw02A4YTAnJ6D
	 fCScLIBT973nekEpxGkQLWoRN6aE5stGiAub0U13HDh5oyDce75y9hkMm3XpO+Afk8y03
	 6JyKNWv1hvdO+lTyPwqahpDQ9+GjhKpxgLtrGT2bAaFrl71xLOXrWrhZlDqsz1Y7Zd9J7
	 T6n5syWL9U31LB7nfCamlehHwXXqBl1zYnmhEZKWA1mLHU/bV+sObJmQQD3m+unHl6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793143327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
	b=C00E/T9He1+YTycYS9TgFLM38vYd/dceXIiPlvaz7hyXtKE8UjcbkRMD8o7TDFkCsQL4
	 76Or4E199Yt9L+wNEyboif+AiR1S46Gd0rDg+XPQSfmI/k9zdTcGp8EGhEbJ5VQ6bZzS8
	 WFb7xYyk9sIWylxXiJETwvlD3BO1pTqbhGFFayUFlJEcpYNbcTI5LjFdTJcFSOFRn3QIV
	 g0cjFLeOJgdLk9Qw4pjOpgKEo2cr9B09sEufBmrPgHBD+bEPixy8gDF/EMLU9Co482n0x
	 ufZK+R4tScUOpFJZSY+tdcgyJcnIacYCbVNHdMyQdlHCwnZRmXaq/40fRlOFhYNjnqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA62606A325
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 23:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA62606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so698660c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 16:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793143326; x=1793748126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=cnpHGUZbIKXsy7Jf8Ah8l/Y9ojHH0W/E2odwf9XisvJjDJI63dzMH3uQl4gs4gJ3zY
         xhYKKpqUSuwcBBIh7xhZMANRcfsp+FfY4S38Hc4kh4FtJ2GLgyHF28dPPi44q1COF8sA
         zcMhITryXJ0kjjf3S5BAUvlvehHxdXi0Y/2ipK8ASxMw5IqYCcNugp9iKd2sJMGxs6kE
         lMVFRaQdI25EEajy5Ab/zvquzVQL264Nq6TdiuavjD/KbJkv/cXQrfhW1ZWEloSXP0SX
         efAbTyBrke7ELIcdyFBRh+pzX7DvyVPJ+NdqDSc6RzNVirCSxg5pfATeR2I40+ii9OCA
         yWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793143326; x=1793748126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=gMWyu3yjks/TWDu+gOO2qFZkFjs1w+9B9x4GnUghXyfBbqRlA++MyAJlk/15/g4WBa
         vGu4/dX8UNFoKAAkV9TOzYW2FpoZ9e1lowQEbUHt6M3Pn/+j4OlsU61irHQI8DtkUtOE
         FWIQXp3Oqu6G0vZDRgX56v80ydvGb4ppZC8mYQdvsSKrA1mXcog4Hp7ovTFpG/URwU3i
         1U210bkM1dv9W9ZXXUqPb1DgsgeSG8DHRBkLvjTIso4NdtJX247B2CXiWFPhVyoNcBoP
         qy5AFS2r4HJXJVz1krHNZhEIAy/3JtuS8NEnaNWuckMfR2Rch7hHdTWsQ1wOM14jME3t
         j3Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxtYpjhmdd5+SJN/MO7nPjPZiheZKn1jsIWJ6rb03/SS9+1+Hzh0qWg48pp99kPK0Vz//MiBga2LRbMww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKmV6HiM6/DgTizbPa0YZzlrO0fNjpQaaF7ONY1gSJxB4X/KiWM
	TbdVLXibysYkbeiNbnICJEMFtRrkBdffSW3Y9DKVOgTuMFogW/rs3fHYYzjrWC5v+9w=
X-Gm-Gg: AYBFou0AJFI79CNCYftMRpkYJV8NSD7aFtbbztcO7ALI4NKzzZtdenQgPjNiajp+go3
	VUr8vtxYT7S05yLBwocyqWBTIwDRDRTHZ3i4MSFGO/vOEL5GPcitUVkPPmc/aIdu2sGxr3J0Yo/
	S9haDw2lvEiq89HYPDK9AALZ2rQXSi+2gBBd+/QtnNELb/wEiV6cRIx9dZcOBTigQ05LCFTrUl/
	Pion75XbDdjHgCVOgGUA+LiclRhSVDvlicF4OQ9+aTmZU1C9pcba+UcFCBalVOXaaj/qPpANDO8
	20Vqg2we1Tryy2yxzbX/mOgi6m2ZU6RAqEasEQijdJmHb+DhhFcp1AvyozaY1Xq5LLO/iCB0Tou
	PipHAs943819GlFtMOG/YpqVP9DDuUISAULt/xHkt5CTaqcGezunTWkX3CIp8E2pSsloZyJKK6J
	+7X/yj34ruX71D9sQ6E5ofAiAvG5l4zwn8a7XkdG1OxoXRrNRQE7B1gFouqFs+txfmHl2yCw20s
	VRCkQtrLBRXZQtzCJAUmcrXL9zNtrvoUCKHooNB33LGCbhNXgEuRSo3aQn4TDXc14W/K3phxSg0
	QrZGAd9sfOs7N90=
X-Received: by 2002:a05:693c:8946:10b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a20407ad2mr1240160eec.25.1793143326214;
        Tue, 27 Oct 2026 16:22:06 -0700 (PDT)
Received: from kevin.us-west-1.nexthop.ai ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm73101eec.8.2026.10.27.16.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:22:05 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters
Date: Tue, 27 Oct 2026 23:21:57 +0000
Message-ID: <20261027232157.3395142-1-kjia@nexthop.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
References: <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai> <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 03:04:45PM -0700, Guenter Roeck wrote:
> > +static const struct of_device_id fs1603_of_match[] = {
> > +	{ .compatible = "tdk,fs1603", .data = &fs1603_models[fs1603] },
> > +	{ .compatible = "tdk,fs1604", .data = &fs1603_models[fs1604] },
> > +	{ .compatible = "tdk,fs1606", .data = &fs1603_models[fs1606] },
> > +	{ .compatible = "tdk,fs1606-0600",
> > +	  .data = &fs1603_models[fs1606_0600] },
> > +	{ .compatible = "tdk,fs1606-2500",
> > +	  .data = &fs1603_models[fs1606_2500] },
> > +	{ .compatible = "tdk,fs1006-5000",
> > +	  .data = &fs1603_models[fs1006] },
> > +	{ .compatible = "tdk,fs1006-3300",
> > +	  .data = &fs1603_models[fs1006] },
>
> Why those extra compatibles ? I can see that -0600 and -2500 are
> needed, but the others could just use tdk,fs1606.

The FS1606 reports in 10 mV steps from a 300 mV base, while the FS1603,
FS1604 and FS1006 report in 20 mV steps from a 600 mV base, so they can't
use tdk,fs1606. They do encode telemetry the same way as each other, as
does the FS1606-2500.

So for v3, I'd like to move the bindings to a dedicated tdk,fs1603.yaml,
where the FS1604, FS1006-3300, FS1006-5000 and FS1606-2500 list
tdk,fs1603 as a fallback. The driver would then only match tdk,fs1603,
tdk,fs1606 and tdk,fs1606-0600, with three sets of model data. I'd also
drop the OCSet check and patch 1/3.

How does that sound? And is there anything else you'd like me to change
before I send v3?

Thanks,
Kevin
