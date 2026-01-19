Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078F72FC871
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 22:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768861614; cv=none; b=ZGHMQUCV/nFkRltzcVGhCGEi/Fpu6LiPhYQFb4qoDzGbB3ygXCBLcA8DmocXi/nJdbiO6fOqgKg/XazGjgTx8G/hZimEQgCbzqtfBW6N4+ARkqcJI5ZPB2dx/rl97Wt42ZNXbdafhXKAwx1acWNHzOhCaoyapPXaeybP8L63Jms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768861614; c=relaxed/simple;
	bh=uvmDme2Gtv/X7hjkklXCqWbJOKuZeI329xIDKGYZh7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PNmQUHrgi8tPVCYlCrBSiERqVoL1QcE8vstTtB5bXGx3FZQPty3lbA+bo30DX7VbVQ5WM4OcwlxD8894Y7N0vrIeQkJWlCTYDpOM4m/C7w0Ud0b2xvE4VBU5z79g0upyp9EYMfaF4TWNZgcU2Z/WWum4zuKV7kSb5aMFS8jhWP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV/QZAyS; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV/QZAyS"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56379cb870bso1289981e0c.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 14:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768861612; x=1769466412; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jURO2ckcFL19RxOJqIofnonofth+ErU8EOq2ZvpXKE=;
        b=iV/QZAyS5ZdTbN/NXkr+thdA6iXQDy/HPTtTRhON7bh0MryP1cX7nUc174MZzcqXvd
         n5Nt0jNZCYAXORZ/rSjJiNUMWY4JFE3HSoGz20t14+e6Hm5PxPzdReiJlgctqDHdTmBN
         eZT3u0/v2f7b8GEB2OZdK3u03woyARCYedt+MCxIwq/y1Y66bhtf/pqtH7BHtCuMGe9p
         jE4mz3TuMQ2mQS+HP34qRXwM+xqPCT38GsPEXebSmNhuvxGNACUvF7wRSD/JH/mj4lGe
         W9zgiFYhj2R6+2OMJ4CMum6e7ktoV5ZU93iPbF/AKHRsbLGajan163+iUNukHENgx0Ab
         xFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768861612; x=1769466412;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jURO2ckcFL19RxOJqIofnonofth+ErU8EOq2ZvpXKE=;
        b=ZpN/9KAs2XdLg2aq2EPLK2W+Aw9YtN8QhBNfQdcGkg6oEKEWjp9Xqh2GDddErB/B7s
         kBwoU68sz2Q7DHYIO4c7+Pcmo9uhG7/j0Mhn2y7J73rjrpk4WLKXTKsOQaiOv6XQJUFo
         pbcxkgLyWbgmfBdBagWdvD/cHLPnCn7pe7W5G63Lrhv3ALWgMwca0EGKW1XLGp+Zv5kh
         cAsbpz8v66QfEY2S3FJXQ43HXgEFe2mALyj0HqYwiqZroRuLQ4cY0L/gcT6wfCGIrSmo
         lJjeT4EiBUpOTP6IhkNfmPuo9kOW/8avlros/hlwmBkQ7ZFxqTBKMbop4aFcYSYBjEj9
         x18A==
X-Forwarded-Encrypted: i=1; AJvYcCVewUFDG/9wc66OD6pdZ7XX9G8IzjgsRKjmbxUL8Qz2kWhFcKCeBP7QLeQi8SbXv354TTAr0qLjhKdd7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQ9ct8/qb4SnHwnqwx0tkCxSuskhRQ0bcge9C2VoC2Pa/L3Ez
	2Z1Cqzu0Xqkv0UgSHbcSx8ATI54vtC9MDfmi3YGr8zGp97zjqKa6BFW5
X-Gm-Gg: AZuq6aKTFCkuGpcBKrznJPfaOwE8Fr1AI7qbtnSc1QeEeUMgeRokPbVNzidk+bITewK
	Upm3dC/qiMXauUiPeLGBZNWlnYwCx9ERPxHCqOP3IGqFI/ui/9VS/HsygpJ10xb1VMGN0bMoxG/
	ak830YZEU4k8pdULX7b+Ms9SPF+tOh4wHQSnNU7NCGwJr2yffBJQ4KMX5Mb0jp/hc0a43OPZriN
	l4Up0X0KLXm7/WX6aKonEqt6zCOa48fooT1tUuiHHLFF4vTUfQma29RcbeAF8UFYGkuCJqYczix
	o/3TozbF1wKeZIi8W9QN8cYggTaQeLwDOVrXrQ9lrPYtc973n5SRBZxXBPiG+I6Pj/PAyrOXYfW
	45SxSgHFPwRJr/p87xYHJWHN44sVciYcSw4UYBRzddo8obXKxO2eQC0f0Raa5E4TBjnoic1mdLd
	qDXzVpyjc=
X-Received: by 2002:a05:6122:35c6:b0:563:72d9:8091 with SMTP id 71dfb90a1353d-563b5bbe9f7mr3512987e0c.6.1768861611901;
        Mon, 19 Jan 2026 14:26:51 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e58cesm3155768e0c.11.2026.01.19.14.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 14:26:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:26:49 -0500
Message-Id: <DFSX3XCGAGAP.2OA0L4PGOLDC8@gmail.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v10 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rong Zhang" <i@rong.moe>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, "Armin Wolf"
 <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260117210051.108988-1-i@rong.moe>
 <20260117210051.108988-8-i@rong.moe>
In-Reply-To: <20260117210051.108988-8-i@rong.moe>

On Sat Jan 17, 2026 at 4:00 PM -05, Rong Zhang wrote:
> Register an HWMON device for fan reporting/tuning according to
> Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provided
> by lenovo-wmi-capdata. The corresponding HWMON nodes are:
>
>  - fanX_div: internal RPM divisor
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable, 0=3Dauto)
>
> Information from capdata00 and capdata_fan are used to control the
> visibility and constraints of HWMON attributes. Fan info from capdata00
> is collected on bind, while fan info from capdata_fan is collected in a
> callback. Once all fan info is collected, register the HWMON device.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Can't wait to for this to reach stable. Thanks!

Tested-by: Kurt Borja <kuurtb@gmail.com>

--=20
Thanks,
 ~ Kurt
