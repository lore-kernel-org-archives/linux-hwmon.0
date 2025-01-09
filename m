Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BA18C00B;
	Thu,  9 Jan 2025 23:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736466290; cv=none; b=mzS6B6oIWhoX2zp3+KmPbMucQ4/Bln5f/CzIzAvh0WBvq/eil0NK0GGDsWVlL4gdqPTRiYAMMyI4rawdVYMYHp7Zseyhl7N3fxPgMQ/07CvR33a74Ys0KVwVPruwmmdIRWHDq3IXe5NquegxN2OTzhqdv+NsxQS7RV6pBpEYXNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736466290; c=relaxed/simple;
	bh=HN3VSzK6BVNi7d9DGVoI8Agbz+IXYKyXt/+CtbErQNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0qqlN5VVsUo6VIsB49t97g7QGaymparMz8SeC649gBcdFZ+yYpVZPQB96WXRtEAeNvAezZ8x9mctuzSKwY8ZKcz+PpkMHlRAjYys9wpsaD8NJyblKuyQf+YBUqTQKZ+fNy8fzzhh+9KH+hQmYSiW6KZlyf+6yb6JQ0CrEeMALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juBbfJgQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juBbfJgQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21a1e6fd923so32649215ad.1;
        Thu, 09 Jan 2025 15:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736466287; x=1737071087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDlXzgbWO5VjgWnbyPf72BhbhVlreMuTibCyADARr38=;
        b=juBbfJgQh/LcRk6iT+1MpM2PtYN3qFZvEte37pcC6jztUk/78QaaQQOnPjMv8U1r5a
         ktFBZ9ihKhu9ltNOvAGHEn6Fgh3YppVEypFudCmJR8R6kZZHSosODY3Ez8c5h5nsxpY1
         gxzDop0K3COXPK+QQwNcl6vrBT5dXRYxgvaAm0EncsMw8kuS+BA6RBWqqgkboLACSK6n
         cjc2bhjRsbMbAsOzLB1jCODWHTpvXsFC/CDhYGqScc00Dm45Icy67ZZPUsn7rxDTLD3m
         HposkgbougLqDMY6LItFuP++EqdBZMpxdNZEznxkJZf8/7JGvHF8FGgIfn3pSzWCtWOq
         y8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736466287; x=1737071087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDlXzgbWO5VjgWnbyPf72BhbhVlreMuTibCyADARr38=;
        b=beB+Ocm2olgohJpVqhjwXyoOkRwwHIT0x6zFI5o0oJ4gkigUIL9f+x3VR08o7A2ItJ
         btdxJORAEMpQW/yiK4T5el8kSs3A25QjyjdC0RLHmyNjr5EIUE4ShFw9QHvHGNiTSZH/
         N6b1o50gVLXtf+ZklOvfuqOWu+TQK0YvFg7RuHRo3eDive8AyuG051IEIKesxgjWrtig
         hPNEDUHVomR4TvBCdTJYGd3NU5fkH+tizqbcNEIYJ6J/QtUxFGYn+XPhRVcpf3kN0UvT
         1J5f7imt7dQOquYQZL0kfsqVVpSkfS5td8elx8uv+3qkk3mKexbIV6SOitLx5Agh4Etn
         QSEA==
X-Forwarded-Encrypted: i=1; AJvYcCXQq18dzzrsRSKEAxUOWzvGMy3Y68OItRPY9DAtgw0sjbBzlSBsWOdEi5ljXygGcGO0DF7vI/jk5uSu5g==@vger.kernel.org, AJvYcCXxjPra3FU94mRcMKSbYtUcydPIOS5GzvEvQ/lS7QnyjBJ3qLHWplkQTRjZMncp1sVmCKEwBSsrKvqZqRe7@vger.kernel.org
X-Gm-Message-State: AOJu0YxtQOPg9bDA/24hLviOv6vGCU7oaFZnvNFYtYWAGfchfZUhY9c+
	PBs9gsIG1RJ22DwsIQl3lZ0qXXe4rgOTvtwcy8FlFRxyq8shbVWbUxYvOA==
X-Gm-Gg: ASbGncuUzzhUp3sFQL8yAHGeKWA2EYgsp3uapBh1553Fw/8x5/lYN6Jt2HYhHYC/60z
	LxvQ6H//Swls8QQh5e2Zjbfzs1suNl/3jGBy7TQGok4pa2q10CwXTj6ViIJBfLz/4Z+3ASWMLrL
	pFAUGpqgQXHxhgVNlvB8GeWmbYCjmuj5mytq0Or0xt89DoCc5FoTdxipnJwQ/SqI+0yB2gfPYJ4
	eu6kTOZkfvFo9kFVU/w9K7y3Y/qCY2EOCDvit94gOy7qyM/NO+Ndrbiv2Qqi/jq/6ViqQ==
X-Google-Smtp-Source: AGHT+IFUVwyXe8uAs1ULkZs3rRfgMb16Ur6SNi78MCH6GNT2lgW+3kXsJVVLEKEMiOdv3hqCq1HamQ==
X-Received: by 2002:a17:902:e74c:b0:215:7719:24f6 with SMTP id d9443c01a7336-21a83f52b8dmr130146985ad.23.1736466287472;
        Thu, 09 Jan 2025 15:44:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217d56sm3254745ad.141.2025.01.09.15.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:44:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 15:44:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Povilas Kanapickas <povilas@radix.lt>
Cc: pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 9370 to fan control
 whitelist
Message-ID: <5fdfc533-955f-4950-9af6-128130bca22f@roeck-us.net>
References: <6e6b7a47-d0e3-4c5a-8be2-dfc58852da8e@radix.lt>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e6b7a47-d0e3-4c5a-8be2-dfc58852da8e@radix.lt>

On Thu, Jan 09, 2025 at 11:07:00PM +0200, Povilas Kanapickas wrote:
> Add the Dell XPS 9370 to the fan control whitelist to allow
> for manual fan control.
> 
> Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
