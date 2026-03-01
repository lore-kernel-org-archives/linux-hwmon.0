Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A448175A8F
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Mar 2026 23:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409120; cv=none; b=OS4pxx/DxHmPiBBsLv8PRZfQ2Y5A+uHk1aVz5/BXUftbH4aDpUkmlVSqjshHOWZf/2+v05hBNuCdDU3cDAZtfHWEgmxMZPBpgvpAU4jVBEjx5HW8fdVt1VZutrsNKCMfyaHqImT5LQkFKXg/zicfmOa0aH+nTplSnJBKNI9ymBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409120; c=relaxed/simple;
	bh=BUbG9VHoEMwn6jZhEe9i4ZwgG6crNviML3hjzpid2Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRtpmg7afFFsTYtkKglk3+Xff10Ctx68RMBBROpcJ3fKjbNNaZCWNNXqP1WDMWtCsyUK7nk+2xiaLK5iyXt3AUEm+bp6ooYYl5X+wf/RYdYef5Zondu/Fh1hr5kQzA39weZ3K+jKz8G9zJcL6aZsC61A25ZH2PM7fPl1iysBa2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHrWjNgK; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHrWjNgK"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732165d1eso3980352c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Mar 2026 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772409118; x=1773013918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVqD17OuZxx4cythfStgDT/uYwbR00pycs97eaa/Hlw=;
        b=BHrWjNgKtP6JvbRI8niy3m3M8v3exrY3paVX9qblX1GeP+HJFSgRxmxDdMilE2XT9w
         WZO/0yUEvWwbcpsLP+ZS2gtXaP1AWGJrfgAX5uLVND3IIyWp6WPlv+p9EqSNde628clB
         dTf7igLUC7C8GL9kwVdESUFHNKCWC1fvc7ZNalu6MybU8WFxQXRxdn0EEMMdKcrKIfQ1
         HD0naBSg1DrC9y4BiKgp5webrHGKDOJED9ZwTfALvECYUEG93YQpOPJZTPEHlyxrA4TI
         nttYucOQSZnxHb0M2JOlmRAQoqvsdKb/x3L8MZTp+4208KX3+yMgnOHQuiwc+60T1uhg
         j5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772409118; x=1773013918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVqD17OuZxx4cythfStgDT/uYwbR00pycs97eaa/Hlw=;
        b=GpXzIbN52gN23fFM8q6o/Ck1lAPNtqL59g2Yg0bvS1WEAua7PmxSfzFjS6cggGlfs0
         caoAmxhetY4AVHtk/dyrwa1RNTrTlMpaQTX9w53ruH6InsRB6c385mpkpwiuJJxCH4mk
         4aTLi7KgTDfOMETWrtdCkyxXVtBqUWonwsl2tzPGaJ15KaBii3+MIjnOKQ33mZhOm0YA
         LfFi9ruju5yeR6cOGR0PG4Ku/HPqYm/1OE1vmNSJi6bhSui5NYaax4rr0jIxgAbYZ63d
         ryidS3B9bMeEkVCyI008WwP1H2VnA8CZBEHc1/MXc1wAPksURuVt0ISqp4VFtsXQLENQ
         z3rw==
X-Forwarded-Encrypted: i=1; AJvYcCV8cqt+dfLlFmZl75pY6bi/Odn0hkiTXlpWu2PU7CEDSykDF3/aCxp6vbKUsKxwCWAXyVV63Lqcz+rHJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYBkGlv6RqhOLYKdGelQzfSm6tOLa+Hb7g2U2c3uDufH/jGIJ
	QwyK23Td+argUzBLS2kGLaSu6/0pDchINyu3jfy01x8g8+4Ujvh1ACWa
X-Gm-Gg: ATEYQzw7O8Qx8jfZ8ECrpRZseX11XTJn6rOYNbeC9dNKtA+6nzZTq7WlJ2uM3cCVxxm
	YzOti6iiGC7PsBH+OdlRORd9QcqBUBIU98uDXcKpyKr95dBYH5RLfwsXge6H3HBioHAtiXsRyfN
	NwoHoi5fDcbMtuA4xC15jIl47Qv2lQyUTOzqmHZfHzh7FRIKXDhh+QRX6gcIFExAehAGo78bd0d
	489xiFIz3BXiqqZ85fFp38znBWx6M1s0+e4pU6iE8pr5DGzI9EV85O5xKI2XAN1Kg/R4caUXl8e
	nkGbm16x+dUWl6AFfCpZV07XWv11ajeiTAm8mdTokCVPYsZpxB57QNhNnj3Bkzn48GV8TGR+AqU
	DGvAe4EMaEpOfzKZUBWA+QZAEoQceDCEB+gOVcm00372OVZEYbUz8Aid9OU4tuhdrB1uqjC4WqQ
	kN6iLR3gwkHunCBtKx4vG4LQgCyvrsilnjg8NbK23qtx9npIM=
X-Received: by 2002:a05:7022:ea55:20b0:127:9cad:1a65 with SMTP id a92af1059eb24-1279cad2199mr858655c88.14.1772409118320;
        Sun, 01 Mar 2026 15:51:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43a18sm14535779c88.13.2026.03.01.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:51:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Mar 2026 15:51:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z790-H GAMING WIFI
Message-ID: <9f4b0e26-fb25-4053-986a-0e5cf02dc538@roeck-us.net>
References: <20260228114412.358148-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228114412.358148-1-eugene.shalygin@gmail.com>

On Sat, Feb 28, 2026 at 12:44:02PM +0100, Eugene Shalygin wrote:
> From: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>
> 
> Add limited support for ROG STRIX Z790-H GAMING WIFI (VRM temp and
> T_Sensor only).
> 
> Signed-off-by: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
