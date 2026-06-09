Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3B363C69
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 15:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018678; cv=none; b=moM4/IE5fxJ8bs0nLnRdQM8RBX6AjrtSpD6R2nSONYA73KxdODRfki+o6UrtHJlAYyL2pTBo7SOQEVPvkmiINj7FL5GtlowG89fAH2Y2gt2KX0WVQMhD+4nCsJabMrjRixyArEZyYjC0CmwVOsSf6o6wTiCex3/QTlOcM2VHwaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018678; c=relaxed/simple;
	bh=c2Vbonmpp6rj3qr2dbpWFFSKJcegr05XEkNbAiBencM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWkesy1YZaOrW1PX3M9ij9w4f0qkOwD479UiMHnl+Lqe3GjWiZGuflNaYGI02IQxDkcrjawLbnfxDmPbmwlG0O8SlBdyDIMxZ6PSj7ZWzh9ClXyNKb4WtwiubP8JooOoLn0Dvro4cOCfirEKlPJTwql/3pJ9ljTvhvL52NMr+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/B8GZwo; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/B8GZwo"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b903567fdso5729134a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018675; x=1781623475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vW+Nyui5MKXVym3LRo+LsqfSdC82w8mTHoHWGRMoys=;
        b=N/B8GZwoiBj1SpZa2J5/qobIi1bgbAXBG9y9VkzlN6n5GKZWggq3pMyEKxokotlPCr
         Tu3ixANhxKZqDRd6e6fQjwBAS+KfpeIV0oGKi8dnjS7GcDHwvClNj2VtV1XqRKzNIa90
         Xs0CUjrW8GRAmczJwyJQ25tMJ7OwpN9slFtjtWOB0WJfqffnXxI9EF8Eo8CepPL4Jmad
         WOey9PgIUJzF2PYEOSuV0fKpFe0RJeqW/2unNprjwza/N9rkTYKfFe1KBXppfalbsaG7
         b5zqFDp/qyoPvBKLO0/TL2orzqxG0HkzH8MDE3pr3RGHn0sXLvd6SXeNrbjP1eF2mwLz
         dwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018675; x=1781623475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vW+Nyui5MKXVym3LRo+LsqfSdC82w8mTHoHWGRMoys=;
        b=AUMgffDwxtL+Sj7b+jYc1E1Qp9K+bEfJXUhWhrpVXOLIIupp0TY/+Vedof627I/VkV
         g2drbq4Knhe6AOriwXrL0KbxYvgw7c2tiLGnYBLOnc8MZ58bbMTC1CEm6qreURMMbFvv
         5AyOH5u6/vkPGoaLtDWQixyCoMqmo4nHc9ghzHVhX+FOlDDnDDrgaSarOTdbuC3sQG5q
         nerASyJGRepGAX9ET39q54LspH6js2MguxndvZ8zjtd29KhZjmqBlnL1ER/INiiHmRe2
         BNVasiLyWHGsbjwVrBZn8AZRV+jKbarUCN40Eqr3MXraJavIXw72b+hyvbuUVIk/RbmD
         N18g==
X-Forwarded-Encrypted: i=1; AFNElJ/b481VUoVvHb/3LTEdYLkqBt20zK3nE9UcTXCcVKLsNtuB3A1bkGXnv0GwxVhLt3SrjgkH9zCYNfH8nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnVqp+riOAlidvcVv1dKrCm672tBY3sPbYz5sNteTebGa4sD9
	Lyv6z451ozTIGNyE39dZLIRtCddCCtrPSl+CL1XlKM9X/7lW01MflgmO
X-Gm-Gg: Acq92OEIZ010ddIXippsmVVkr5rkyx0galpTVI7L6gRRGtDRpPXDcaP4YuIua7+2Ka9
	V4zW9dl94YJWHgpYyx684Dpyy1nQF7iXebWYxjBrPqlYS8zddI6d5KLF9pwkukA7VgqY8t90FV2
	5c/gTycLPpkLKExdzH1hrdUjq97yVfoT5djHeMJ/+9XrSG7liwvtddju/0Vdzi9YsI2ICa6zpa1
	BnztFvr8l8lNroacgEQn1pNiJGgjNTzCK7bmho+Nd5SHJybEQ5dZyiLJvpT1bw/gRnwW3GaKI3c
	24eIWTiUkZ8a8g+XV2zTfmxI2fYfWTS28wpBpixoIJSQ9wH7rv5PII6TLQ/wWQA1AGhiZZf2dl9
	Xeda/4B4v77rZord6XZivshbyJ/lW0kf+aVlAJ8N+w5sifZzq/OPkijtdPVRCRuavuk3NfdWHrO
	qGOzmcWKiBZ61NNeIUIg0Aa1096OyYEvm5BWhYGBEFImMY/1Q=
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-370ee82fa3cmr20984064a91.1.1781018675521;
        Tue, 09 Jun 2026 08:24:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a28c0esm20097402a91.12.2026.06.09.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:24:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:24:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
Message-ID: <6a9c2204-fab7-49fd-9918-2b0f7237b4ce@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-1-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-1-1c206542e652@analog.com>

On Sat, May 02, 2026 at 10:56:52AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Special note for the "adi,vpower-drns-enable" property. It allows to choose
> between the attenuated MOSFET drain voltage or the attenuated input
> voltage at the RTNS pin (effectively choosing between input or output
> power). This is a system level decision not really intended to change at
> runtime and hence is being added as a Firmware property.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
