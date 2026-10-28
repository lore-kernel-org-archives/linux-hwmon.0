Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181489;
	b=NS9+JnK8cthUPkVtBc4hkh7bVcP7qWGwAeSeCI0dbzTz6Aykpvy8b99Mcx7pDU+O5Xz/
	 1hVJ/68Sa+jeWzZv5QQ0xxiDSzUX2zDqsw1BGY7oDd8iMF2DEYLop4Njuqh/KcJmiH7YU
	 VoXmzTk880Yd1l6nbDt9gI8r+6fAoSbK8R84zh43uzIwVBF2OdzcWhneMi0j8+rC+cvYT
	 1qrgT/mLWdubNs0M6Wvin03CLmSNTSA7v6scDDCNGH2Durixo3O/dHnhRXMy+kzcyPI/9
	 7GP2TqgU69UedX1jW9lycMYwa4Zp7NGJcL5eAztsdp5Ayt7fMVeehmdPQbm67Ypzxmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
	b=Ybj+1l4b9RaGLJc7v7mAv5imPmZwyVliPLmJO4OKzHv+P841dHF7/1T5ubGjEGa0N4JS
	 glq1g3pPsMZ71j4E3Udw927MGIGlI4PgrEJTv4VvqfteifylGqDIyfGSFBea+Q9FYGe+x
	 mBdPZIq1N5iSgxl4T2GqFiTr+4356o00em1QyGXqpH4hA9CH03vkeycBsn1S2PK7x+INp
	 +BygRCF4A0wRkG84iH43PegiwQgN/VG5P/UkVS2P7TSgO6ELKsPdyVDg4g196Y+4A/gSp
	 EAqen2N01JDHlSthyp73Ei89naLzWDdXBY811Gt03Ch+RiFmNFp9+QFiZ2E0ZWsAh+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mR9bQWfr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A22606A31A
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 09:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A22606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mR9bQWfr
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5378b281aso3752865ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 02:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181488; cv=none;
        d=google.com; s=arc-20260327;
        b=peLrg7Ndzi2jCUG8QSDdiUfiakd6a2wIXY2UOemN5NmUm/SGvVVw72PB8geWouWqbe
         8l9Aq43TcpxDaMJBh6RIS5la+oAxltOOkwQCFcmu0K5JbVXLdZ54coGyl+eT5oD8RUHL
         h0jnDrBp38SBOxq8UReFUqbIcwOWap7OPSm72BFIGn6V3K4bXXQEVkdheUOeXgrqzgG1
         hcjC+FIlTnDzyLA88oqmC2Qdm9/C3ZtXdBX5uQqysJGi4fc2UI+uanDnx8o8btldTQ3b
         sokdhiz9fHVEjXBEcgqXZSorjc4VcwsFWlzRTczh4qein6B2px8XCcXkpeguXZvHwKHJ
         j40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
        fh=jvRHkzs/nUshPKAU15oa052aBcIKz9mfcMCrKu0d0ao=;
        b=evlr6T/bhnAMHvtB1IS5LsouSlbnbyx7yPFE3Ut5PPFi/PkNHfr49pYXm1TOb89oiC
         Oto2PRw+qKsI0h9RHbHUlcZhS8k/UsNCS5Raj5dD0aaRrLMlrtpNBIqzakqEsLZ89mhh
         wcmuYk+ul5GRm5FJp/ByLv5uPBnLgXGAa2ETYid1yNCCOI6Y0jVQuDCwIKkzcl/73leJ
         yS3EpNEXJoZJa/bQB2D4Fob0NVVALoAzb6y2Ie8ZS4s9DaGORR8hObXFC/bvOUlUwYT4
         86Y/w1/rafczotAQ75cXGiVBHODR2P9Qqkwe6eyThX89n33N0xZ2ilt1B/H5VNWm/0U8
         mBUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181488; x=1793786288; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
        b=mR9bQWfrpQSEyA8w8vQQpTeb6rqA1diuIIvyEUu0740fATagH/JiJp/CmESJcbGX1t
         3swFfulYdW0H3Im2yFdkr8hucynKr3+xmi8kKfQgoMmr0+/ZHpKkwKjdYD+pAxW/5ypb
         qGND6lIi7HdU2Z3J4SBr2o/5Ada+bcwkR7VI0cinq7eo3GNUPyLrtt3LBzt0CS3D6cwO
         b/7ZAXT+9dxEI+mPU0qARLR3FgwDiwbOm3FX8rYXcUC6wUgO1vtEc0NBM7VHtzW9dYZC
         25X7sJvKuLP/PrkfCXrZxOpQW6DTF403rb4OI8mqLYx4rqCTid4sxdU9jqW3FQuxO96A
         qpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181488; x=1793786288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
        b=Nmzj75Lp3ME+mt1hdjOWzh79coffKjb1ZKzFc6I3da268KcGCX9g/vwI0gMTE5oyWy
         vxuhVai680xXkhC3cKtEhWxL6rbSIMtA3cxs5S51P0ySV5O/54wsiOSZ6U0T/wVvKcJL
         CJ3S/9VzGK+KrVR/4bCA7+CssH6JG77hLT5HYz+eWxFf393LfeqeYWQ31N2oXhKq1tBn
         +/goME2GlWSm1/EFl7nOEspoGt3eRbsdG5DIfBgoBtyzuvth2DqR2mJCCDRKtkHsxeVF
         PqvvDHk2wXz8NjRAHqKXAdhcHx3cdH9U0nnwRA9YWqBIDEIt1jCNue3meLVCnLD+l0Y0
         fNkQ==
X-Forwarded-Encrypted: i=1; AKwUvByd8b8PxaoUxiVBl3qegvedHhbfTxAnS8GsuZATNjLhhpnKJktoCy72o62bJn0bbBdhj+30DJiWe6h69Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYCTTn8KAkHR80JexSGeS9L+9tJTAg1q2uslUKhWe/AzuFnuzM
	uUokEzmuc8APkIdQv0PK2NJiKv/N2qbqo4k8yURmDVM4WZjRhWNeFVT/+W4LNWt/SmtvBb8PUBz
	hUppuY5zyDjzjh1n6ZkTLadgBEBfePwp31w==
X-Gm-Gg: AYBFou1wE/0+Rbir7q/fUGdmGjOti38m+sJza9qDY2tx+glBAbEP3/b8O7WVDtDZrDS
	SmmfzQBUlMrtUl0onJwga65uTOFSVshiUP8IBBqwol/vPEQj60lwaJDYKhDlrC7YIkVNWhRzaDa
	UJt8LI60nyj7TpQgyjfF5jiUJALdDv+m8pMqUWM86jF5CEWTDc3kzGLCFQywurnJYn1Vvmga9Kv
	fFmYZpSgBaIwaGb9Hmd4ASD8Rw6mo9Ht4eTciQTv3/YFchLErWBUGAii5XjVoRWGjKQXWvpVvco
	GbI22r7kwIZt+lVOQMxSpGN55tzjqKiu5gBVFa29vLDS0+YjIvxxqUJj1nicj/wPoemJlts+1vN
	aOcvyVtpZfWq3Kxp4ovMsQ5lJnrhYiAPyPa9H3ZITLGDbzuciA3pDQWsCMi3p14wKm8Lwt3W2Wu
	cb
X-Received: by 2002:a17:90b:1845:b0:3ad:50ef:f5ff with SMTP id
 98e67ed59e1d1-3ae580a0810mr1345260a91.37.1793181488076; Wed, 28 Oct 2026
 02:58:08 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
 <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com> <1fcc110e-7269-44de-a415-1848922f75f6@roeck-us.net>
In-Reply-To: <1fcc110e-7269-44de-a415-1848922f75f6@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Wed, 28 Oct 2026 10:57:56 +0100
X-Gm-Features: AclHuK8myNrcWnb-qofZFRDe2ZMmZ941r08XlIFfykt2gE8457WimKvkwEaJGN8
Message-ID: <CAB95QAT99VRMofNC-nVL7uhwf=otgt4FWx0X1Bf_aoxpOfCgAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
To: Guenter Roeck <linux@roeck-us.net>
Cc: remy@demangeot.net, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 17:21, Guenter Roeck <linux@roeck-us.net> wrote:
> Me not either, but that would (should ?) be a separate effort and might
> take a substantial amount of time to get accepted upstream.

And a hardware with the second EC, unfortunately.

Eugene
