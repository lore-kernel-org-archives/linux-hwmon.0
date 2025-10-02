Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1A01B4153
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759440971; cv=none; b=D7ZpAnhrLv//VdQiaPovED/fLwdvn3lvtmy1MzuE1xjcox+KWA4rrH2Y30bam54qPNkzICKZ6kE0MhFGtFbNy2nL+C50jqromQQvT6cT3iR6/wp29xPJhk9V4NE88P5GTvXuC3//lqleKzVyqnWXNEnWzVv+cYKR9Tp57RXbntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759440971; c=relaxed/simple;
	bh=sp7MqWAOc+vFOYpjOgl75lySjdmojqGQ8r2e4EDXL9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E82KcU9xkhzrPsqQtBaz6PV59x/r63NjMltCoMamzSlF7aYpN0Blaj7h3IPPYa+iNj4I2czJgOY7jCniskAM2poyBhfr+4xDZb1rnMCb+WXVDiclg8ArihOcOTNHDUedvGLB3e/uNe1bzFdCYuj/MI6tly6f+RsT1KeFry0Auaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDLh9pE5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDLh9pE5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f1f29a551so2105922b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759440969; x=1760045769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVcmxEQDygf7dbtJ7z7prj2fqI+0iw8tFUmQnUGZQm8=;
        b=LDLh9pE5L1v7i8Qe63FbqO925JUuryIDlUKRerLfEfRkPDH3e7lrZbhnF9f5/x9jIO
         CWdoXdKTxZ8RuBt8JctqnWp0ZlDkRUg/qyiu4/lYWHBhkWfLVtEkFTe+65QjEE4tc6mM
         6kNdiTgY7Z6jZ0+i6GODfEyffXYFfvdh/r+PstPF917eeLLjR0slDIbZmNw/Y0mijCru
         JA0vPgZQxqFkXs5j+mwvTZzrD53kFysM2VbCeZGhqP0OLGAlXJ/4do09O0oo8nHzQ+E5
         l1Vr8OXlbchFWuHuYyWg2tPsIDtwt8LYAdU4D2FH5yoyIFbBMzud88OlvTant5SCiOj6
         grRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759440969; x=1760045769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVcmxEQDygf7dbtJ7z7prj2fqI+0iw8tFUmQnUGZQm8=;
        b=VB5J7fmzwiLqhn17wMgjz/wBSiccSM8vqPnWpw7ndbapudTRSpD+IF5XlmCgWK1NYU
         ATTNKKKm3ZVcVztYeHwvXGUeQlJLxXr/s3sDNTTeBoOfBPHBc7DhJ62fwe5/eqFBQ/KR
         Nre/+zaPMevOMke0l8dGu91Xt8ym3caFJu5YqgrNWh53h8MXyQFZ8f4kNvtM+/S1/tg6
         yRWuFdDzpoPvfoPA8E5WNFdDJTE2zeMt3nhy8fpkPmY8yfVp7K9d5gTHvQP3GrxQpzP0
         EjYTHVDSsIMVn/dKDLKfGqwOlsYa8I39qPh5QvGMSxU6AwgS2VrU6l2MMVxEjulKEGq5
         MktQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3858ITm8Tj65QoWp+0CbMdDU3SfwZ+aCCwvS1EmlmyBbYgHUXtgYooGm+PhvaHFtraQ+bH+ue+isZrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+ZmJuR6EKvLBSaS1X7yJvBFusUBM40s3eD6nnxhNjbk+4TEo
	e7IxwYYjnfknLIuSHJBNJr828bNqPy4/qVZSOb40V+rkRjPwqRwyesFw
X-Gm-Gg: ASbGncsZO7uBVeu9QAzf2bBlz5TPx17XZjzfDDLYYuWnwkfrQY5ErZB3XFSxTnflJ93
	+jtGaVabkYfDxOIDfSKfssod004hh/PUr1GzcLLiiw7T9MVyywkYPwajhRlZI8KWk5CHz1iv7CA
	Wk+zte6qzHi1peIgupWpKROiF2RqKHgjSL91QV5Vrhcrix1jmw//kV3NixMsxKrKJV5jgyv7YGw
	Fq2kUE3kWKS5LXFLQaXBWQuS2Va1cpP8tw5OvuKM/x7q626D1fxiQCHGNARRqVoWuGrK34sRoT3
	L1r9Bv/UjoV+nluCAH1GvzkdtaiRRxV41/xIOP5avfmjk8LVH+lX1Q5BLsANpRUDuWqKvwMIZw5
	OR7lLsJNFTI8JVrdNtymriKKF67/mxo0z8sxr5P71zBNcm/jeFXIeYo0/Y9E=
X-Google-Smtp-Source: AGHT+IHue+jlDN4n9W+cwiftgnT/dK0SHQVUWlYe3W8oi5uNcGPOdbvkqxSuoPni8hyXXe4UdBJf7A==
X-Received: by 2002:a05:6a00:3991:b0:77d:51e5:e5d1 with SMTP id d2e1a72fcca58-78c98cb783fmr1124337b3a.19.1759440969414;
        Thu, 02 Oct 2025 14:36:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb16d9sm2989597b3a.22.2025.10.02.14.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:36:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:36:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Emil Dahl Juhl <juhl.emildahl@gmail.com>
Subject: Re: [PATCH 1/2] drivers: hwmon: ntc-thermistor: add Murata ncp18wm474
Message-ID: <a14a92fc-a21d-44b4-a613-e68747edf521@roeck-us.net>
References: <20251001-ntc-thermistor-ncp18wm474-v1-0-2c64b9b509ff@pengutronix.de>
 <20251001-ntc-thermistor-ncp18wm474-v1-1-2c64b9b509ff@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-ntc-thermistor-ncp18wm474-v1-1-2c64b9b509ff@pengutronix.de>

On Wed, Oct 01, 2025 at 01:45:27PM +0200, Sascha Hauer wrote:
> From: Emil Dahl Juhl <juhl.emildahl@gmail.com>
> 
> Add support for the Murata NCP18WM474 NTC.
> Compensation table has been constructed by linear interpolation between
> well defined points[1] on the resistance vs. temperature graph in the
> datasheet[2]. The readouts of the graph has been done to the best of my
> abilities, but the compensation table will be subject to inaccuracies
> nonetheless.
> 
> [1] -40, -25, 0, 25, 50, 75, 100, 125 degrees
> [2] https://www.murata.com/en-eu/api/pdfdownloadapi?cate=&partno=NCP18WM474E03RB
> 
> Signed-off-by: Emil Dahl Juhl <juhl.emildahl@gmail.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to hwmon-next.

Guenter
