Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E6481AAB
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018978; cv=none; b=kJl1L8qOLK/8tKTRML7BneaPSfyHlxMAu/dYyQfiCa+CjZnkwVBesVpwDS9vjUPVWBax1vhC0S0dncYXmLQ+Gx8TgxMDFHgXhiy8xUcVoYBKeC6ubjzAi63UKf+BdSjVkqtm+e9sfndjBPRh3mVEZQIxTssOUY1B9yu+sZWM9WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018978; c=relaxed/simple;
	bh=oBMTASf5/yZwoC+w3jFNarp/B0A2dybfqyHkkOvqM8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnFze/IXtmx3/ekiyEcXk2r0Qa+GCYE55TlO5JWpBMlbhu01YuG5iqF9/4MJNdgCeUYegxXxQ0+d4YVaQ+VRJR+9NFzRB65xwUml4hW5K01DhSI8RtRIv9jzusDkdKbKqmwwHePAnE4Q1p9DfUdCjoTDgA3aabwb3TgerfSmi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmeBzIEm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmeBzIEm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so3019548b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018977; x=1781623777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=YmeBzIEmqoQDEW6G9Nh6k5kFysNDjseU6avBkwrDBJYuuBNz1zC4Ect25XU7rM30FO
         cJquyzccYYLoLs8ipzxZj+2O9YnVy//fCjtLIpGgAEyvnk+wzcuBP0MT1e9rHZm48zOp
         j9orlUulCCsfqBGabTATEBQsHEXJf5qpmkIHaUxueI+4cXT1U1DCXUAgMUX8CUgoiBl/
         a/jvAGmJ+VpJfREee7cR24iyprwoBKKYH+PgEK19f0QRGkAMaKNkdhSBPtn/zSdaoJdg
         LvduC62uXJHYaf3+U+ncraiEeeVwetcZ941n9mPl86Dm53MvATCKHtBgn04JmVXEz5z/
         yQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018977; x=1781623777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=oTPVBPr90/gf/+qa3xFtg9UTODfeWyngMK+v9Oft8+AttzKODflLEdMg5tL+gOY6AU
         Q7GCLHHIJhcDqO/i1GN1qI7qVQIhASEZOnpGb1lLru6XEEkMdwT9stULE5hYaEABZcLX
         cm3vo6w/lfGQzHMt9TUHiAMeAgW8EHpTKdEcwD8VdzglFxwCTmezGYjC68yt5yiwV9dk
         MYLz72nUux6xMSKdmt3P7hDYE37Evcj+8Ul9EAc62h7QirV08XoS2qkEhzep8yupnm6t
         7HnHvgD3MLf0AoeBmESMm9WwV2bmCWMM2zpWVlgCF7vGQnqdvd/sSei94WIFt87Cf04H
         R4qA==
X-Forwarded-Encrypted: i=1; AFNElJ++ghtj+ETDS/Xq57OXUBzJU/zxnyR7FxBzLq2Ogb7D0QRsScB+b1OkKWr+5NM3ZDaG67lmmbIUIHtBdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY00f+r8PAMVozXubCto/QALun2XzjNRbq5vm8YNqBeGiXZI2b
	c3sytgfnZvugKsgeilYxh2KG7YiRVRhp2M5KFlOxboi5Z7R0mBjgU6Ry
X-Gm-Gg: Acq92OGzKPW2l/e30TpgJKaRYlXCqsgwWyi1SX1J/CFF06y1aRGy7M6J0b01FRVWFUc
	iVuHPc0RRN7I+H5COhLPLd4j1OFsezkRx4MpPm/YasvmSJXp9BoRJ2Dsj6k1cCEdb8c0Z1MmHjT
	kz5tFtwg2mcdDMTyNxKD6Y04nQxA0+1o1wxHaf06+PhY+GMx3zDTKQ8QrD50yRan7kPTB8cxahA
	7PlJ+HB0irpFApMAVSBWrzGAT/XxcCCTpilHOLLUFgd+dEnOxFBZJyvylTNz32UqK8yt1vLqke/
	YSMGsRJs5eSvNQciFee2R/QqbmnXV5K+xe+KRA35ZJ/sECl01U1ZrVsG2F73dlPFXw6DbtIcq27
	VfMwogLQnBBSsDSpl/bDX5tjlyieH35QYJ3dtEXzzFerPkyu5qjrVBzIHeNqX+Tbt/8hPkjNxf9
	TGnZHJYBIum3rZ/lKPbqsqoin8+Wxk4F0QKMowHcyh+U41izB3rKqQR3BdRw==
X-Received: by 2002:a05:6a00:1405:b0:842:3841:fdb9 with SMTP id d2e1a72fcca58-842b6823968mr15870182b3a.31.1781018976770;
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm21603784b3a.31.2026.06.09.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:29:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <7f1a04fc-587a-4a5b-9c5d-8f73ea5b2114@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>

On Sat, May 02, 2026 at 10:56:53AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 Hot Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
