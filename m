Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E924DF6C
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 00:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262724; cv=none; b=Sy3PESgWg2eIhqGV60gu/hX5JUB5n/vyBaLn/iHNua1hp+8Z7Eufjv1bYGD5M+jJ06tXnqfqJZ5EzSTHvp0ddI1xLqH9Gzma0G6T3gD8CVFAndBD4n5gwnO4x1/9MnBwSp9gLD4ngiLnn2m4JkkT0k0ybsw/k4KNeACIyyxlI7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262724; c=relaxed/simple;
	bh=TBQZ706dz2v4czmT9bidyuALkagvTVYafuXaqgUtD1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZ2cQD0RrZYTyEyprKeos2KOuAR8qM3PMH0sClG7lmoTM06+1f3Xm3NhDyKjkiP+opi5bMaCW9ZTEyi5J78hOwf1/K52XyuaKizdhOF/yjPX8ajAtx1jvJrnFkSfA+bKei4A8i5vacjtcGTQexFYIytCQ4COqH35+CZeVTo9cgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3Zxm7KM; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3Zxm7KM"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-121a0bcd364so7847825c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768262723; x=1768867523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GncgElqiq32w9qexfmBMBu8AFPxia/UeTgvOHBdx+u0=;
        b=W3Zxm7KM/4R8zViV7ZSa89zGO8HTGUCNGQmS4FI7s17a1bs4qo0ylv5Z2j/shLpGzR
         plrEvnAM2klVglrUaI83dIjGu41lC25Mrc2AuNoM770yUvCmHDg+PkT5LbLYbjq8l5F4
         WbfrGQ4ZIvAAQMNvNFxrFDutJz2e1wk2Qv5l9Vo3ioAs49BC4uKiLIpLfbie3nhlWyFw
         voaEghDLE5SaDgEWcC9wwwLFifH2V5H4z+eTJ5K+IZJ9W/RP9fT1ZBF5bMvg51a2jVwW
         Gs+O1pYQ+a79ED8wtpWpvvxJUbxK01VosjOc+COsmJcq0esKcLllHEy+2xEJwvD7HrYY
         j4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262723; x=1768867523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GncgElqiq32w9qexfmBMBu8AFPxia/UeTgvOHBdx+u0=;
        b=i0EYxVxdysE+/rtygWWbMDz6gh14UcCvdue1y9d8cRUX4JyUw3pj9KlD5vbtAPmRnV
         acocEvPk0aF7y0na6P/efvKMdbKrIdam+t6Gpnt95uWsNV7QmKBWyxxTtwUVX8yRWgRb
         NQxHL92Z8m6MjK7wpj3o9/kDbvBZvHHWxOWd8eX732zIDPYfRi8gSkY4vI/3+YlaWYYv
         udXqUYxButpAtsgz2YFlu1rlyx25eo+K0NrnDhaWTwO5zEJ9GQcESRllb9Gr9eetrPz/
         2WCWYS3K4OTylEyOehLqTSQUbJNeFf0GIng2S1TEFbu7AodJeXTizBxsleyLMFpgCvQt
         L7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLYCkIe8rND1d3tMiB5UF/IDN/bgU2puLO8sGPyfBNOwj95oqnsT4VgZN1nBA/yRYAJBDjWCxfA3hGVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzISjjqmRQPddQwKQWR1pEGnphHfDc27syDq0QgjrrIaoKVDhHg
	5xDRVLsBcStmlx9H8fxuPb/wm9Ksal7IJfU+Vsurbc4uARTEIPdM0i4T
X-Gm-Gg: AY/fxX4wQ9nkuxX9pH/kWfERtIl1ddZMSIjZL9asPuTJPxEAfAYpb5DtEbIH5dgrRi+
	vXg/1MvITy4KzIrPYoa4hCv7+fC5bcPTCNCOdHoJ6tC9LCygzLZeRerHx+R9YcUKII4akQNMsuV
	Hw8W/j63Sd7GfMLyIHfzJJMJwxUATgDlul8KZTEwxlHjC42BSubj44MBxvJXGKcE/khRHvkZwcq
	j4UkkW3Kjteg/hhkpsTH+4GN0wGvDUfC3tZhk8eOwlCBAvXPH8xVUAVJC9Pv6Hr5UIlQ56AnCwn
	OZYVpQ2AzbtBD7CjxRlXOAWRkJlvz66lH3rOs46Jv4DZkAJ8GhF3iQl/R0sW3A70SwsfResHOLC
	z183GxH62XIxa+FaNLCVCeirvYQOWSKuuCcaNXYYj+OYB0CrZjQkL5KH6KaTSTyRN7CAs1pF9rq
	f1/2EUJ4v+9BhuM24exKqQfosx
X-Google-Smtp-Source: AGHT+IH2st110NI9ogLDebj2HC2DR5r6GB93sOZj+ArBjQ5xYxHE/S9g7UoPc+q/6FHGx3twpcufbg==
X-Received: by 2002:a05:7022:eacb:b0:119:e56c:18b3 with SMTP id a92af1059eb24-121f8b7bb53mr13709063c88.27.1768262722658;
        Mon, 12 Jan 2026 16:05:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243f6c7sm20613445c88.7.2026.01.12.16.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:05:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:05:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add mps mp5926 driver bindings
Message-ID: <90dd6919-562a-4697-843e-cca988806cf6@roeck-us.net>
References: <20251223012231.1701-1-Yuxi.Wang@monolithicpower.com>
 <20251223012231.1701-2-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223012231.1701-2-Yuxi.Wang@monolithicpower.com>

On Tue, Dec 23, 2025 at 09:22:30AM +0800, Yuxi Wang wrote:
> Add a device tree bindings for mp5926 device.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Applied.

Thanks,
Guenter
