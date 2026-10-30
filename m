Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793381947;
	b=mTuC3CewE3UU9qw2aOLY9BaH/KDFo2Z3umYI5GogVd/nrM3Q6VlVeCax4okQ6evykCLU
	 nWkMkawzt97F02xkKnN6VMDidNf8hchY1OsGt1IqeSS9oOgjG6guxa2WpEQ1FG8OaapQ6
	 hKqE+S3DpjYyBte+gV4VS0LbC/wzoWztTD1oaAC2fTJYgXcFVZXjFa3NJdlhtLT4gaX8F
	 DL5irKEs/+lnC2/C5iv1+hc77+w3zi6DUajQrnTahGAtT3+8pSybqpDIJErlozuwQqlD6
	 ogjFD/+cx0N+FnZ/d3HQEIdM4X3IIttqo/vjY1hH2q/D7SQEQ2kZR4p2mThPPRxDLpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
	b=N4rveKL5RTQa12+q6PFBUb0QOnT1gvED6Xz/Hzms6dsuFAIgehloT3X4ndgebTKFGhsc
	 i23sTz6mlnMHOY1uDRCNXxUM3OITaPRwgV9PjkPSNP8tQU+BmjxlZPWpi0SwOl/PY5s/d
	 i2ZACg6VDdtAY93vuj4rOmWiFsVIF31pn1Sm+/MIXNLDh8M4IKU/+yk5NzvOhwR5kLNbS
	 1JG9AkLNe5btQsGdYa3tOKKMLe4zxvy3CRbdYrtjkmFrRxnxCQUZSjel1YDS3M4D9Fc8H
	 74pB3PHrkHW5g8K6jJ6zLr1inKenLMwGmVLep1o4yU3B4hC3IsJI6GVx/jR/vjRTVcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phsogC6Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA17606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 17:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phsogC6Y
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f259cdc86so87311185a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 10:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793381946; cv=none;
        d=google.com; s=arc-20260327;
        b=KVLaJjLF06BbZACVOTPlVkp8J6WwIq1GpdKc13wSDVeTtFf/W6v2CQ6PA3Gm4L/nMX
         X02K/2Cd7uewEeduTEUQdX9XrTO/agEya01N0+TAK8OAFWZ+v5ej7tN3LXEyepbmNVNM
         ofEcC9aLRnagNvXmxVo1eeaH2MECB8EyBVuPPPm3RXrCusONyzELkLf2sLDYINcWDUWu
         KlPALYiVMlnvuHJC0db13SecOm7l2a/+wm+nAsxSMXrn7Rj4M6YuzGgn8Jb+KCHW/1j/
         KSN1prnJqbSPfAxL1wfCNDaivW3zHjRR4vhUIpQ4lC3iiXuxPmMTESgLu21CipmnFeyi
         Du9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        fh=d4tpDA2LtysrWf2WxN2nG8a8VwDu4ZnNVTM1LXgOB/s=;
        b=kDR1g51AppKnkYlHU/YIWaykJmiJHwbbqCTN/m8I22InzQrYD+L3cp4sgcnWVVi4ao
         lxxXq3fXeOeVtJny75uubExwfc5d/KffV1vGQ/kXzWCOhYJTnsXSqVlKWibMWfm6U9nL
         ElQKWA6cFTPPtQgl0T0cdwVYcXo0r7gtZbXj0jg2Kpu4R158hb6YlSpxtpJ0t4rvjltm
         VkEjJv6y9855DKkZecvhXVM9AqNR/2rZDSfJtqPBFhV4SMkiV+c+EdAra9g/M5tTyc44
         DAkzch5WeGo29sjSsCXho0zLLEnymScQwpL7iEhC6HdDUlzPIzI0nfXQwN0IMCkTMRnb
         1XoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381946; x=1793986746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        b=phsogC6Y+qtsb0QGVFGSDDf5T5Kh20EJJXMOsGlfuqX5VlyD6VMPQ8vSmR/mCfXDMo
         2GFmmgqHGJeNJVXfLqFbsvCh324IQWNuBvDyY3Pcci4A5ESkB2Z3hSC8Q/GovLQZtU8k
         Iwd/evxgoGgJvL5OMRp8Or9unuzO0a7dxUCCb1SUwkmIRNALmNb/9AEo3rA8zEPai2hS
         6s703AX4O2RsuiJcwFc0vfd5vPLtYQXa70N6TaP01xJsrNXxTVYKk/fFr3SOLlcEd4s8
         RDzu1j9SEC0hqsaxOtJpkWxdEywO/uUnHQY6XgxhjDO0E+SPt3O/kmthnolh6hc3rYrL
         CNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381946; x=1793986746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        b=x4F7pUb0U1DZ8Uu+vtBkggnK/qvy0//CxA+Nsvu5GAUomV1w3/olUMCbiPhMMcUW75
         WYYerdRT8+6oLkIJKQNBU04DouzxwA9KwoMwd5wDkrccJV/zGUfX92oLhqR1a777MWq2
         tCLzWMRT/foyPWJhh+URS263+EzqALlOGxRBCxQ/RS9q56qr5CyLDTP7frp2TMPzULx2
         oIC9U6ISZx8y+10XOUosrGij/BKYf0SO/61YEU0bDj0P3TeM+0yD8z6+DNgKro5th8xm
         DTdIynCOWNGmMAQV0kK9EBmNglJosKvNugWMdpHDmvFpUoX+XWFAdp3oEJskKvHc1O+Q
         roxg==
X-Gm-Message-State: AFq9FYIl4dXTuIWGmNxrO6ynBEurG7iDOgrLl4hAVye+zR75a0Wir0Az
	UmCyTTrA0p61FbGvtME4i7im6dYVUQgWyP99daKzWDh92a5wNOw0xoyStHYBaxeJbkoa5q13p8B
	KNz30RPTVYvAgyRpkiR+9ZU5msplQUQCRuG/tJSQQVA==
X-Gm-Gg: AYBFou3X2fuqInGorG5WMf24Nm6MAz1s2EKk/waxg7sc33aPtPtGEkqh4a79fgldCg0
	X0QUa5GvdqbmVmBVtwRKkQzyQ/FxhckqD5BYuiTdfJCryPvkrSrAWFm7XRRD4XOA76bb+0bsFD+
	brEzgSLp5vwWnewwjvyOEI3D10RiuD5m3DkQv0eqQpGGtnHhKeKSHxguQ4c0TO346B0dVEZqvZN
	4cKekjj0tL/5Pv64YK/J5mjOkO2/eXnLsU8+dLr81lW/RwJy0Be5zbbkOGAIHSRH21DCOltTcef
	kVwcu2EoTtajeLeW0UuTubS7Kxd1A2URXmA7fELfYmg+Q+JQmKEHyO6OoRSTFfZ17RRw2YbNwAe
	e4JC/Hl+HD1dRWRSd6kMc0g3hGAz++UlRZSa2
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id
 af79cd13be357-944217439e4mr528491585a.19.1793381946045; Fri, 30 Oct 2026
 10:39:06 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790512964.git.lanzonza@gmail.com> <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
In-Reply-To: <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
From: Zac Lanzon <lanzonza@gmail.com>
Date: Fri, 30 Oct 2026 13:38:55 -0400
X-Gm-Features: AclHuK-QAySofGqN-BH0ysfW9wI2BwE9lRTbGJWzIzgQZTntV5tJ3u0NVFiOCeQ
Message-ID: <CAPusjWrmKH4wHK6LY7NFi1=+rzDY0uq5N4dgKC4FuUh_=xGhLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: (asus_rog_ryujin) Fix pump control source
 on the Ryujin III
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Aleksa Savic <savicaleksa83@gmail.com>, 
	Edward Blair <edward.blair@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Gentle ping on v2 of this series. Patch 1 fixes the pump control
source on the Ryujin III and is Cc'd to stable. Patch 2 adds
pwm1_enable.

I can rebase onto hwmon-next and resend if that helps.

Thanks,
Zac
