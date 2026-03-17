Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315339281F
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786006; cv=none; b=dMsXc+88bAP/dW7i1Xle3heQDna3ZCVKmOtNhXO4pIeCGVAcJSxt4jrPwKKYC2t0y+XfvEFkAOaAOIszzDc7DXf/2/i+wiqRmYQG6CywIAviVdNVGGnqolME060bGBPvnqiYJREZTCbyAjr4Lwdp7AMAr902XWPy0qk3o113jLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786006; c=relaxed/simple;
	bh=y/EmYIg0gRmVkSyOE3fKWNsZUImGNsUyuRa0ygA4/YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAd1R+kuP3OHPh0MjRVmPDXPBznT5sdsbg4YcnVVpT0yWYUAoESWhHYxChQDXOQh9NSsrvLfUPhsAkzeordmLCzEa7Qcs7jvTIcxOkkrxPCEiqpNIE0adzOMq+ZK9h5kSCE8GLhtVfHzc+HEAFA9Wnvbx5M2ayqXrIlsDFYxNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0YgK7gH; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0YgK7gH"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9003890eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773786005; x=1774390805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yPZOqi1ryUibCEpvsqKM4HgGM7evfo9zGBJ9SdBBPQ=;
        b=W0YgK7gHc/sgaz4Yujm3o8Qs3rDhg6AVp+xfKH/+UQB8pJ3oUxrYBgAgLPXoAQDC4V
         vsebvbJTRoGOMXztaJeMjYdooCeoQHTEDkY3ugSHgvOHeQbqQDRFh7MLb6vlIpZHPc2Z
         YBeDCnGb0dHt3yevD4VqOhE8cWiQ9d1qNgo8GRhKDbGvzhKRLfIy5dChhqtZIaVL6bOF
         QEHfKD+sG0clVFqvGwC3Aq6Mpt2a2apsZsYi3JlBgbXXrO+SYE1M09UmQR5nlpE80ria
         QucN9fBBj8vmcvTcOiiuaAtvFVlDICjmMfMIYTUfrJsfir3+PrhMpSmhXgasdrIuySLX
         o4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773786005; x=1774390805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/yPZOqi1ryUibCEpvsqKM4HgGM7evfo9zGBJ9SdBBPQ=;
        b=MGWpQREvAPlruHdUuXbzw5yrrUs5EMX5vAAaRTLpziisKNBoYCugHQNMY3fox3baQb
         Qx1t044MrHClftEhljK5C4+SnaHCGmMXMaX77wNyMYXSvqAZKW2Cv4+BrDJM4QgwACoa
         GVfpMEeLn3ao7PS90qD+NuC71/v8wUYbf03j4pYlrnpoDqOsVUZMLqVqqQo1JrzGOObG
         sav3sZGQphDx/NbxtsrTuoSAKkWzqYxgCGpmnOlDXdfxhSt/sdRgiBJCcGDYVOGNkONH
         /g0xsINK+r9gdVA1zmVmn3rXrB3NoWQTboKBh5Y695YnhKyFjriJx8KRCuIqDX+zWrl6
         frRA==
X-Gm-Message-State: AOJu0YzDWAxMp7x6lrK2o18YRARD2aD02qUTZ2gV1pU6yRNmTNtlbLpw
	XglRi8oJUdO4LruWz2Qh4O7CE30/HZHqmhMMMf5tef0JJ1FaXKZbmn9l
X-Gm-Gg: ATEYQzxblRDrIq0KoZgNJqSYtvZkOMTtxQ4nZeSiGRww1MtI4dvwa5RuGoHWo5/t7MF
	ayZe2a7MnZJOCcUaHY/KHzjDvCh6juSu7uAgoeGyn3REdmf+hVkheBYMvCACJblgpXSzThgIeKJ
	eo2g35P/cXY286WkyXsmM02aNSR4LYpBvAquK1FiC2PuUo/KFIl3ihpQG2bEM7LjT8HcGcewTQA
	AAGnGlcKR6qk+GHelH3qc/+pwMJdOfRvZiM/KlEWTqDlioMLJr+x658KveOPRyVHFRV9geP5Vcc
	Kl7y/iKlJwddBwt+cfkG8Owndjy4MmvGWy2IEMsS44rxlCZg6cv57aXUkX3DhD0PNEDmixx5O+r
	mVTbeEM2VLhqikWNzZuZ1Ap1OCyQG6YVylmeBbArrh9SifY3z8zGHq7GB7JNsGkf5glAzlwyt/d
	F0Y+jMhmh7W8iSOSOHeok/DvhZOsMulaRrMbh737bYpN8ojzM=
X-Received: by 2002:a05:7022:90e:b0:128:ca90:32e2 with SMTP id a92af1059eb24-1299ba8b9a6mr586674c88.7.1773786004776;
        Tue, 17 Mar 2026 15:20:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5583533sm1291913eec.18.2026.03.17.15.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:20:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 15:20:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"vasileios.amoiridis@cern.ch" <vasileios.amoiridis@cern.ch>,
	"leo.yang.sy0@gmail.com" <leo.yang.sy0@gmail.com>,
	"wensheng@yeah.net" <wensheng@yeah.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/5] hwmon: (pmbus/hac300s) Add error check for
 pmbus_read_word_data() return value
Message-ID: <8aec79cb-3884-4aa2-870f-6e136f6fb373@roeck-us.net>
References: <20260317173308.382545-1-sanman.pradhan@hpe.com>
 <20260317173308.382545-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317173308.382545-2-sanman.pradhan@hpe.com>

On Tue, Mar 17, 2026 at 05:36:53PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> hac300s_read_word_data() passes the return value of pmbus_read_word_data()
> directly to FIELD_GET() without checking for errors. If the I2C transaction
> fails, a negative error code is sign-extended and passed to FIELD_GET(),
> which silently produces garbage data instead of propagating the error.
> 
> Add the missing error check before using the return value in
> the FIELD_GET() macro.
> 
> Fixes: 669cf162f7a1 ("hwmon: Add support for HiTRON HAC300S PSU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
