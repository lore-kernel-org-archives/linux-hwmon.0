Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228A32FC860
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725322; cv=none; b=XzTfpJPP4AXjN4WefoKKsZLh6gp349i3pJfDg8HchPgwBBjw8Ah6rUZr2Ps24DcCH7Jc+1ctO/TAUel0n5Wl5Sq/n8jf1EMTD+W6QOLjRmnahbkrRi7bLh+itF1qbx9AxX9iZNhqdTTc+HVAg/6vHHCGls1byxqMWj712U3vTxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725322; c=relaxed/simple;
	bh=4IsV7Jk2i0IjnsnSne3q7Zle+vqi25l8etXE7cYgRQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rei7vpx5vBTVPQSk3FPsgpjSGc4kkFY7HoBJyWJx5WZ1Ygkwb7yglNpxiHVW3YnP7Mgesu4oiz0cCQ8H5BurjLNhLdD+Nt5JtAAPMLAw/tvtlTZMBvOu26c8JVMKqWGFo57XWTR61fgVXujs7HZWXWA7rindNPcbBdISNAArt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYRf7YPO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYRf7YPO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f343231fcso1706169b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725320; x=1759330120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJWIOp92/VBWQGa84CQUa//9ShSJrAl7Jpy8tRSqKX0=;
        b=PYRf7YPOpDp+Sp5XALPzKko5U4BXuoL05ILooC3GS51tbK885v5nGFdf2ZPZa/5nTH
         zskN+1o+I+VcFJeWv+N+ar9a70fg1A0WT5y25LqgaxhiwAXaipuF3SNK6RTHBySnREmK
         S1khNGvqshtsEqzeCjU6qtlO3gvPaf4PMDrx6NSZesHzcLNc1cIzPjOnsKIBYy4n6L7V
         2/taPo+kCzzydBkdfSYsOfyKyr5Q5p/m0ZAz7QBOZe1PRyGWzTqeX1Dje0VlUakEyrDc
         2kZjsGFRmAlTJXFPfb/TxO9ulbkNTyKMvTxPvQMOjPZFrSRN8cxeuuX7O4vRe1fESSeo
         I2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725320; x=1759330120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJWIOp92/VBWQGa84CQUa//9ShSJrAl7Jpy8tRSqKX0=;
        b=P7liqImEs4rf8+G0v0XsjdMsxCYxziorr4SPOeZgXqLdAZvkrddR0AQi4q0apqpej+
         lPv3xl5dQGHHJ97mxdafG7pTAVKQTn+MQQl06Omw6drJgFTq6ucPVkgUmw+ZT0SLhhNo
         gmfVO/cqWGleX1mT/gRyjeG71PTbwHFwLAZsbOmZHFrYqU/mEXHak1QFm3aoqFwb/dgb
         gxio951cJQHCvB4xDLObyGoDUQzIcgiHCU1yHYg/OpP54EGY2T6lc30EhwGw/oJHw5d2
         TQe+XBx75qkDtHgBXGwbVwd7Q34YuoCEokYrwxRtsxbc/uGYC9L4bPCsz/jf40SiCDYg
         r6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVTXlgKy5+xxEJDrx5GEiBqamc2YWsE6DAYH37VTSwvAYpLsWMqPJr+ocKcAVB6/EOTiDCSOwnS7dogg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH0nA1NqMBUPK5qJgUxYVqJX0O3y6WzmVFqugo4pT5eDqx43hd
	qQC1t+82P+MUuGLlEpHqsAAc+/nzqBW9N7HggJJBNPl0eDwdC5hwciR9o8q9fOis
X-Gm-Gg: ASbGncvz+eTw9j9Gsf4+S7BinbTyEFBWtQ3CX/lqqRhNwQiD+eBRPk9przryjUMK9Vl
	shmbGP6+XYTNqb1nRk9HRtfj0aLARSn/wsy5sR36vdpAq/E5oGjqXrouZcTsrryTDJEfckD3noN
	Gq3Q+fwT36rCLjhY+HBz4Cm3srOozDBw3/UoNbLvaw6K/j6HkjgjZ4BdLsEDX3DwYQf8iIlQlj4
	PC4IkpWsEuFdLa0XwfVkJnVaw7eNqiLdmPWH5MC+dE+aqKpDcSQzfDbCJwSk8obKNgp/dZjsZLq
	6jEY37QfPy7GZtL8TThJ8DVLt3ubEaiRI31Euq1G+q2hZrjIhAADmB227kQhOqM4aqqEZzEaSIK
	q8IZYSKxliM8jTLp3AbgnvlA6WOtJyfR2zFc=
X-Google-Smtp-Source: AGHT+IEMIvzVH3zVBoShxM3FTiWizXcSgelVZEcdTmdAc04uIJbP7xXcGfh18a6UZkI4nte1tsvgBQ==
X-Received: by 2002:a05:6a20:431b:b0:249:3006:7567 with SMTP id adf61e73a8af0-2cfe97e9b8amr8934175637.35.1758725320273;
        Wed, 24 Sep 2025 07:48:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551f3ee095sm14195440a12.34.2025.09.24.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:48:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:48:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) increase timeout for
 locking ACPI mutex
Message-ID: <6a9bee4b-58b4-465f-b386-533bb2787cc7@roeck-us.net>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
 <20250923192935.11339-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923192935.11339-3-eugene.shalygin@gmail.com>

On Tue, Sep 23, 2025 at 09:26:56PM +0200, Eugene Shalygin wrote:
> From: Ben Copeland <ben.copeland@linaro.org>
> 
> Some motherboards require more time to acquire the ACPI mutex,
> causing "Failed to acquire mutex" messages to appear in the kernel log.
> Increase the timeout from 500ms to 800ms to accommodate these cases.
> 
> Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
