Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0226C386
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441209; cv=none; b=YMPFzPmU/n0F88U7bEPCbbzZxZgvErKUZbp7uemT4v7Y5dX8XTb/uAhxQeH1CsI5m6XxftNRVB1MzMpc7O1DG7HrhqzMbr8gTu1UPtOwb4Rwp/lSWlC8x7KJWqIWWtR/zRxmgfEfhnoo8MghyLEx+A1DRIB4VWkoqGh4a3bIX3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441209; c=relaxed/simple;
	bh=QZyjVm+9qlTscaf/2GM3pYF3vTllD4oGUQoj5iijRD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aO+98BM3uDqD1yGiN/Mo8TfCVGIqlHcDUmBSzbLhQq4YlVbA1DG2Kd6IEyW3rORVBB8Q0DNNLgXDGeVnXYgpF2rWY8gUtzZeJhYMisKAsxyUPscnGAzLUB0Eh/s1RtYcJ/kWnw5qeZwjyxj1SP2nA3pmTlzfH6JOs1OlrE8Hy8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7lplOoU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7lplOoU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781251eec51so1436453b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441206; x=1760046006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzvSx/NUfO5A/sP8Sid74JR7vLvHKqFXwTADDrDwvwI=;
        b=B7lplOoU32NtZnBaEcAoUDF7zee/6T7oDovCbzrgfIf+jFb/adJ5olMT9BTv8dO4Q7
         7+ZjsnEtQcdo+5nCblClYC4eaDBXfLIWqtMtkREa1T6WPuHcwitFgWKu7BQ6eNBaGEso
         goXogGxuv4pxjcCI5vBK9gqduy6bkiIFAWw19ClYLUnfBJ+lsVYBYRi644jOV37VOvOC
         NOxYG6ZU5a3WKaR7s2FETmKUvaCBoEeL0juweza6J/hiXRR4KIl1Z6quWy6C7sEsm6d2
         UZgjBiGfmr9C0i23givvd2PNfa+f0zwUxeTSBad5IJfQdGhKuinX1QYDgryvbb517z2u
         aWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441206; x=1760046006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzvSx/NUfO5A/sP8Sid74JR7vLvHKqFXwTADDrDwvwI=;
        b=Kmer+bIqKRwaRsa6T8D7xCp+EV9//ZSeejsU6nGrHu6XQwKgzffFpsF4aoH26keUSS
         1I9LWf2xq3O4jFlYdtmMde84OyFrgk+AzCYtzCXYdKAcwKwQD5t7vW20ntO4Hbzpiqnl
         xjmGjWr+7YHqXjDA/xS5AOHKncKNBegEDpmTwE9+Yih1hfHe7BTF3DaznLv562alM8Qt
         aWqg2gY7QL+3/2SSvmf2GMB3Zym04FKlRnvrFuULM+6zt6eHWIS9hXttxcFI1/Xx3FNT
         3bT3BF8u82duRXth8pizlX76kuEKkM2xp2g5AQx8VkqAaIoI3RY803cFRGrltaRtnKg5
         CAug==
X-Forwarded-Encrypted: i=1; AJvYcCWKjUF9sRDHTnKRjylE6bf8yfYTk5ub4PwQLqlxaWPMSjkjsOzWsOAWuUzozyNPIU1AIPgbeOFkjG20Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSl6F3u9lO/uqMg58dIXdD30L+nV2Swbx0lU7zy/AIASzFhml
	544CLbjT/gyjNmv7Xl1wr7ayYaBMrySNCrQFNITWnQAK86Kq+ZbW8NV+
X-Gm-Gg: ASbGnctOkkoP3/RPpv4WdhZjUYeR0Nlu2Rkcz7pz8zwq2XvSoxxA/q2R+jzKYrUljkO
	tMnP1lbrQRWzXyI8tVM5049WK3oGdIC0YoT4O4udZMYTeKhCFA2gNN2bFk0ILr+ifWfAeLw1RKv
	mzSV7DnEDrLD9dx1+WXxvjop7AUpptF4bCyIw1W14bN1JZDkItEnEdPP9/hawokpYZ6vNwsSBQB
	D2aETXBgRM+CEt71cC9XAgnkndKD3OM1qk70Nba0u20yvXwz1sE4vs/IPDov30UjhJAHQcj5+bh
	KAdq3MPjKYl1n145d7+2nE0cdExhk4JbVAoEYNMuie2zsaTn5ksJEwt7tIZwPfG7Ms/wMilxRGu
	WRh9r88tJLk0npSstuucXjHFGyATzYPPGtC2FhmFatiMk97urBtY41gmTYwQ=
X-Google-Smtp-Source: AGHT+IGk4gvP/gENOkVT6kjl47nctt4XhJQnUfoV6K+YzmVcO1xaHw+ws/N6KwZw6NEFY3MPioctVg==
X-Received: by 2002:a05:6a00:3d16:b0:77e:7302:dbe7 with SMTP id d2e1a72fcca58-78c98cc299fmr1139185b3a.27.1759441205632;
        Thu, 02 Oct 2025 14:40:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053b77sm3004309b3a.43.2025.10.02.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:40:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:40:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max34440): add support adpm12200
Message-ID: <c6ec8937-91ae-4e0b-a0dd-183c5b150b2e@roeck-us.net>
References: <20251001-hwmon-next-v1-0-f8ca6a648203@analog.com>
 <20251001-hwmon-next-v1-2-f8ca6a648203@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-hwmon-next-v1-2-f8ca6a648203@analog.com>

On Wed, Oct 01, 2025 at 08:37:08AM +0800, Alexis Czezar Torreno wrote:
> ADPM12200 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 2000W. Uses PMBus.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied to hwmon-next.

Thanks,
Guenter
