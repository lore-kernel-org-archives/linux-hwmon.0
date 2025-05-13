Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12428F93E
	for <linux-hwmon@vger.kernel.org>; Tue, 13 May 2025 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143685; cv=none; b=ddMYDAqKWxslLBke/Q30r7H3mZXNVcmrbLtj6+hByS9Y4CMDBqw5LFc0RI0Z4zliBG28gnF3AjojFS0NBNrz4QHFHW/p3YENN+apvk6Ii0TdWoDKxdlOonBKjF/9hJVZDUuxir14shtncxigzt02vizPyT0RWKzUgu5oTN2Y8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143685; c=relaxed/simple;
	bh=EKDS6s6iACf88Jm9TBFiUYpgFzywtuSX5O5u0gVgkL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBTDVx57d/9hWyN9Tu2c9E4+qQ4PUmP+xS1v42pEPSGt10m/4k7DGlk8osR4fzVVeE/m/IeX8qJGMcVwvKbx/PMQak947ZE3YtSNwGQTa6pnIuD/yWqtsXzlKNsZ7KpqGuLL4n8y5o4RxcyansYIDTUL+BCNnCuzHf4BbFjz7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfckpajZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfckpajZ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73712952e1cso5534177b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 May 2025 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747143682; x=1747748482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qmz3iJ+nYM1Xl9HLMkX+1qel15etUWf0H+Dnu+WhucY=;
        b=BfckpajZjs/Qp1Ff7qHUEUExp1bDVdHMnTbTcnp50LKir7ouGPEdh+j4cabv9wGJ3D
         6kiFgLoquNMGXc3Oe4gzbtvIQulJvjmoH0KPwMcHSehjMJZBmzBm3GAZZdP/RoZpS5ON
         nN0q63ujtY5KgnSKDzjAVhIpTJMFkY1brU6ePR40qXPjPKhr7+iamuJjo9RdMYgegLp6
         Jq7n6vmyZlKgEcvN3dw9vidvX8trRMhZkbDuzlrvSRI4Z/ijmHH2R2AIt0VTQquOoHCS
         8iEnUPHR9rzaeb+rL9rbVh28F9ADr974QT+eDWDJ+ZrVi98KTHyVcbBnmOuQ9TmHrvbe
         ARiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143682; x=1747748482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qmz3iJ+nYM1Xl9HLMkX+1qel15etUWf0H+Dnu+WhucY=;
        b=qkuCjJNDm2VSnbiGm/0Fyn7ZpCqmUPdKXudtbUal9qcUFtc5Mx6mmETrOjM903Pe0h
         TNdQEqVBrcga0MiHw6o5ck4WaP71NM0D9C6unJom7C8UamkM6KJuFiQZhX5zotPK4Gme
         sQO7X32lwSokAyGSCa7WdPwFZn/tOGGPwvlpLL8wWJrE0Yh/WLabpo0JdMpZDtI/aHB9
         zUU719TbJHqPkRzs+FqLQ/4k6snK2pffX3dhzGr2LUrzABq2UROSUY/xRmwFVvfgBVYM
         PrX+EWTA1mg4EbG0wXXvT+T7Wg/+/3qVdDkV2xZrHZG3xpsvM0IrPIT0j35EhYZ8wVGI
         slHA==
X-Gm-Message-State: AOJu0YwmEFybd7P4EElkfUEdoMpOG7k2QZabeJP24Sx4vRAyIg0Lr2G0
	AE6GZvY0mKTa9ABnLf6elfkAMe3CJgjV1rAg7YjHbvrxP4fCQkX8
X-Gm-Gg: ASbGncukT7KmUujn6ouAUFYednT1Thc466cpwVbIGUFlmGQ6KwhRjHXhasH84jzSiTD
	QY8A8hwqAsyx1QLGztfjxla7Q0xY9CIZKTfALM29QU6CvK6C1mrLEqr4CvIaAJJQCBqMb0302oU
	f2D/otE7ls62khuSP9xTr/dtjOlTIqZh7xMxta8nZoRgpsRAVhPb3jcMwlDNPhkSbO1NWtvLTOa
	nRnNpC70BLvdSpNA/L7/jcgEvECLsBz4sIoDi8zzbKGh2wSoQuZwsv7QKkRF7wrGdqfCcqaAfC3
	m64ZJc21ZmK75xq3FTWAXDhaI9gmsDYuKqwZOETL0pK9SiBrCLN4MWFgfl6w+5qS
X-Google-Smtp-Source: AGHT+IG8a3Q3GkOqgHEy9k10EjaSuCM1uDEsTLSnFn8eFX72doQGpQA7zPf6+3x3AVGDpDwelOzZoQ==
X-Received: by 2002:a05:6a00:1394:b0:73e:96f:d4c1 with SMTP id d2e1a72fcca58-7423bfbf150mr24427969b3a.13.1747143682516;
        Tue, 13 May 2025 06:41:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237736db2sm7890109b3a.64.2025.05.13.06.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:41:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 13 May 2025 06:41:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] hwmon: (lm75) Fix I3C transfer buffer pointer for
 incoming data
Message-ID: <e968f010-28ac-42b3-a438-640859dde1d6@roeck-us.net>
References: <20250513111739.508886-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513111739.508886-1-jarkko.nikula@linux.intel.com>

On Tue, May 13, 2025 at 02:17:39PM +0300, Jarkko Nikula wrote:
> Use the I3C private transfer input buffer pointer for incoming data
> instead of output buffer. For now this is harmless since both of those
> pointers are union members but may confuse when reading the code.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied.

Thanks,
Guenter
