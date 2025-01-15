Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BF24A7EC
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950973; cv=none; b=l4MGsyQay9rvPIJmU5iSszUbWBx5wnpMMkgF+X8nHEpcalJU5wJKFuxEDUocDl44/I4db/ihkzKkqLOV2ufQWPamkCCtq39Euchat15p2oa4rMcF5c90YhflgMaICB66EJvnpzh7wXncjjg/eKJPtBCMaeaZfv3yaUwRZopWr2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950973; c=relaxed/simple;
	bh=wwQNU30hCn2W+8QtJtNf+J+9IObXyrXv+Q93Y8ZzzOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmePTAGgIfJqZ++R3RTXyfLlqHSOYOlkXhLJe3EpmXS4/EGGeCi378KwAjuRN0KyGIJ5BYY9yX1zH3c3PtkRFQgZemI3ZioEjv3gL7A0ZQTWhX5YnV6MkUip8zdTGVpdc0lsqtACdpcB+sxwsCG60VPtuK5hh7xjk7CN+5l1ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+AU0HUN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+AU0HUN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166022c5caso107903505ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 06:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736950971; x=1737555771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLZfZIk29fPTPGNzyl+hl+ABm0UdPeZ01DXUYzD158k=;
        b=Y+AU0HUNJfG+7Y2ESG9upCFDKF45Vpg4jKPeSHfgbro63NGLUVcr00Csv3r/G6GISn
         mGw89T8WA1ZyVGelCUoS61Lt5EQuu+6Xvtj8afGbp0IX5ijo2FF5ChYJZFnxu24Rghup
         3dbX9weDD84DPd6n/6wvVQYYYL6A8EZ3S/5h944P609mM6vAO3nW8Ir9ie76HFMH/EZo
         4h51SwCKu6BP604SZvrK5rMslS4XDxfBV2XOx8bYq5TAxWTtxYVqet6TnhXw79a01uOR
         d73n+Wn/PqJF5hsRG9k4kQneqrEONEdO5vO4ShTWKC65fHBR7XWCFIaAO3pMKDzQmQOZ
         I3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950971; x=1737555771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLZfZIk29fPTPGNzyl+hl+ABm0UdPeZ01DXUYzD158k=;
        b=bZIBSfq+7nF1fdmf2R5m+eRnXkNyx/IH7Y0+1FxLX6e+4Of2rU+oyz+2N2i5IxjfYO
         1RpTv5epQzUf7rBqRYqp/4ifJ2rNotxP8Mq0mk1+B4Tu3wBFBNYNAf3/yEUbILWEyY4n
         X3PBZaYUtGi64RiFRO3qzcpVrT2pdXEexWc0kx1YzYGsZCpj9mXXPCWF3cCqTOWLVWaF
         SajjQlSkac7k07LRvA4IOvAZF6l0sygoFpHvrewxa9t2E/bi5YcXBH9pavFsebda47Rf
         RHFDdqHm5Xa8Rmsnne+ZhqypDmQOooAcFeGBXpxjCdWolDFCg3uccVXuViE04/eJpTup
         loVA==
X-Forwarded-Encrypted: i=1; AJvYcCWS1xRvzzY6QrjORAfsdZQQQvrFjlCIrPm9gJmq2NtrFoVg8a8E0GMqyPH23TIX/aUu8JrePZhbOWtpWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyyaB77HNkz+nZ4k3mq8G0guqnAiaxIea3A1eKWh9GyKG0r6BV
	ePosTlFsbWIPcieV+b6E0DzC34QqAoomJW+uLMF5Y0XFNoUW/RRA
X-Gm-Gg: ASbGncuqLHStTyURKbh7B8YBrA+7So5HKLyFuLgA9W7GP8JsmAR/0o2miAw3Ifb6ned
	w1kMcsO2yD7CWKMNqUqdyiX5JaCjBq5C9e+vKW1ls4tfyxKiLdGNXm3XmoG0iVpdmSsBhiV6BAR
	YsUTZy884t3mn7HCgsuDW14Y8YkamAB7cUK+UTBkfb0Ohsl6GdTFCA+fuegdFImDhAbEHXP/5xk
	O1mFHQyFVRurdc4mSbuiencfZ4Gh0EkA4LGayhbb2kdRuZiHBM8ggK9wiKdY2rHFyQTIA==
X-Google-Smtp-Source: AGHT+IGP6GG9qaVvd9CUPTUlEHCqdb+4veTp0nKx010L5LhWcC4aFeB3sD4pUyBjPY19wg/zkUfnIQ==
X-Received: by 2002:a17:903:186:b0:216:282d:c69b with SMTP id d9443c01a7336-21a84002ac6mr435134415ad.50.1736950971082;
        Wed, 15 Jan 2025 06:22:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c151f4csm1445587a91.5.2025.01.15.06.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:22:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 15 Jan 2025 06:22:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Russell Harmon <russ@har.mn>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (drivetemp) Set scsi command timeout to 10s
Message-ID: <a274c894-5f2c-4e3c-ba43-a05970ed2495@roeck-us.net>
References: <20250115131340.3178988-1-russ@har.mn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115131340.3178988-1-russ@har.mn>

On Wed, Jan 15, 2025 at 05:13:41AM -0800, Russell Harmon wrote:
> There's at least one drive (MaxDigitalData OOS14000G) such that if it
> receives a large amount of I/O while entering an idle power state will
> first exit idle before responding, including causing SMART temperature
> requests to be delayed.
> 
> This causes the drivetemp request to exceed its timeout of 1 second.
> 
> Signed-off-by: Russell Harmon <russ@har.mn>
> ---

Applied. For the future, please remember to version your patches and to
provide change logs.

Guenter
