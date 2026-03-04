Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAECD353EE0
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661591; cv=none; b=c1r5usx5KxJ0GFC/wuL8rzL1mGFJ0N2QyVtxt3rUCTDRMbTsO/bipvwfTT+jhYOQ9G4VUpqU9XEMDdzzmY0CppbccSZT8Yl8BGyZhsssYtgt+YpMKNPihkBDKhr15WaGJbR5Akjo3LGA13g2FJUQTTWdE+XXGbAq54zJXK3LefM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661591; c=relaxed/simple;
	bh=vJH1V6u85lju1D2ht4Tr6oMc86eTR0Y62dS17bcaRDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeS0a0qq4edGMRgOePQx7Z8r9goL8yjbKMJvtjwL1rCZf1mQKXzLHJEl19U1rY4DoZHUkKesvJBLhYr+kElCGTBwdvSfXoYW0SyaA8rfZTZzRt6XPcUiEhtqMaGgbANtyOo0wx8+DpWA3NmxKUcTWJyIAPJWBkiMrjktik1WaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBZVL396; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBZVL396"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so2560536a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 13:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661590; x=1773266390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYJ27uup4OixsS7eF7/w7BH01G/LyWR+RSEXoULjw5M=;
        b=aBZVL396rqGAdh0Jne6zlQoY94UpNimaHXmhYbnweX6xpOFNlaDtH/CxeKLDycqqUy
         ijIFAHzxYhgxNK4xBqTTEiG2mAuA2B+XeHWITUgdHmTzjybD5UYO9uNBB/uJTOaPsCEv
         Ov7fjXTxDczzxCmqc3Ef1MwP1mWO1vReUt8k9zotd4RhxiqiA+nH91GTEOvTiiEkBjNl
         CuLwd6G3aMQCiAnduuFC+pO/O0vPEqFIB17zZQs+PF3zly6GMSYEUyxgMxD78/CB/U6o
         op4hRbina87S+G6YbYG4mpU5fDXCoKsRaFWif5+xCKnZipRYZ/d7YIuUkjoSbyEqTP9Q
         Tcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661590; x=1773266390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYJ27uup4OixsS7eF7/w7BH01G/LyWR+RSEXoULjw5M=;
        b=cQD/3nirn5L7MlFc3TETnvnBh4g1YpAsIfNw6tFIyNubzFOCSWrvNK9Zszb7QkR8tI
         r2BuTfMwtGaTLXIPE7MKDBb6jH3ACHSG3jRB6SPvRxoWbk8hgydI6qcPCh1RQx17isBw
         9+WceZyoAD2kDKFkdqIlVnbkIEWWJBKG6wmipmdgHSfVdJUd+VuP5qajzKKPDO08ysjp
         DnD2iJoGeXSNhaGBaFT05Pm7mFLoanyVGZHTVwGMmk6QOyZ4YAnbbn9X6apovXVV8Dhp
         zhZMH+aVqGoCcjdQQ1436yU8255oYpWe3ozAZJLce3vqkh1+MQNyfpWmOBOZ7sW5T51p
         Vj1A==
X-Gm-Message-State: AOJu0YzWFFGDy5nAsidCmpXCFUB2OqtegGpTk5gCLqiINoimv+BQnoKJ
	SnieWnGJkr03Jn2PRuvvrY3tprh5N6AJbRjWpTjb9g4uDZoWMt99i/kw
X-Gm-Gg: ATEYQzzAQsQktRn1Hai7ESzSrg6jd4wchct7ZTS0rKfxVbeF7Z2hRIvcEIK5MV631s6
	DCWQNmV+XIhlYl2NsKtZyHqBsCJeI+UMObHyfMK1rVVyu+xBv8BKhnOcN1tqhgREqn4zBN7rlll
	dKm5kgcInRvsgGwZ+s6ImlloXk4xM7MbVfEzHpxzfZ6pRquIxqHexMET6PbJYVJgq8EiFTjxcbD
	AT8QnNBZ51kPe4V3Kxqpv+Erh7ZHO51a7EuTQ2xaVG0088C18mhUQ64Yn26O1am5YpYiuKjKyJD
	sJfIhIu1DuVcw0Yf8M54CzFx0aJpP9PZ0LMTR0SOH3sq4vEtux4gE696Y8FwMbPIvT06OzUl2us
	X+STTO8NB42y+kyZC5f1a5uTLrI55ybQJCjQHPmXm9mzdcG92T6fRkb1nVd7Mb0xAqWZsazpLDw
	OqTl/baQgfqiONPW3KbVTphncBB+9qIXJf0RcssIy2kSd1GBI=
X-Received: by 2002:a17:903:19c7:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae6aaf6261mr30302195ad.34.1772661590201;
        Wed, 04 Mar 2026 13:59:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4f50ee6fsm96593135ad.85.2026.03.04.13.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:59:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 13:59:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] docs: hwmon: ltc4282: Fix scanned addresses
Message-ID: <8d90bcba-e713-4c61-af9b-45e00008ba88@roeck-us.net>
References: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
 <20260304-hwmon-ltc4282-minor-improvs-v1-1-344622924d3a@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-hwmon-ltc4282-minor-improvs-v1-1-344622924d3a@analog.com>

On Wed, Mar 04, 2026 at 10:17:47AM +0000, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4282 driver does not implement an I2C .detect() callback, meaning no
> I2C address scanning is performed. Update the documentation to
> reflect this by replacing the listed I2C address ranges with "-".
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
