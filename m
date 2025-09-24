Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31931C6FE1
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742235; cv=none; b=mVDWCAS441FZSC1ZANr/OTKJhEdQukzHg136xfKbQ6aS0H94uPrr3/Te03q8tp7ZBvGi4dGhPtjRWk2g56SvW/aNRhYqBc9Ym24Mnt3odINyc+bPL1KGcBL2NGMPxt3x8VHLEB4zXv9CWNQ2B5HDcJaXq23t4NALnQbcM6nT8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742235; c=relaxed/simple;
	bh=/e4i971/r7Fw/eEhFZtksigrKbXlOazlZrmnop2pcDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhiaWoaGmWmkS28hfcRKiyrcTl/SRkQRRdT4gBG7qr5eY3jr3QRY59+1c0mM3pneTHE81Aq/0hbaRwh8d+COcnzB2KrED4h5v16MEUW91K35/PUUyfHjhcHOQE/3wzWkuLBYSZeHnw73aHmHpKxCRda+yiNPlUD6iGxP7PyTseQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy9r53sX; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy9r53sX"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b4c1fc383eeso125919a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742233; x=1759347033; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUNFCslYIEFTynDU+6nP8kR8zycndcSpw/ZB7QnT4fg=;
        b=Dy9r53sXzjFA4OGosg08HJwOXziqxlItDQtBwhIUQBYF3ya2z2YaKYYqDROzkYHnR5
         jgobOyaaXamafXOK8TmIoAtxEJhEwiovtAeHJSG8i1wE289enI9+XkNSN3o6qpZicvsD
         wsbiIFclzdeGe5lTdRXD3jeIgdMg2XAsV+l5rVX/Jhpyw5K4ez7k4YP6aNH1bdzyXv+Q
         JZ6Ge3JY9uk1A7iMrQXnrRo/2ZIZUxe2xVtMBjODEsamHv1+eOWf6m+Qjx2Vzx5HnbcT
         0Ywl2ryUMZdnL1wdqY1+Cri6419o9v0cqL5u2ke7J2k/AlLuPd8hVRnYeUn63HtEFJdD
         7eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742233; x=1759347033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUNFCslYIEFTynDU+6nP8kR8zycndcSpw/ZB7QnT4fg=;
        b=RqdOVX2aBwM4EkegiO/waLneyHmXUl2odmuYR3cqewN8y6QRgn/X43RGHsLxNwPjh7
         zoGF0twXe9ZmwsGqypGbAarO3CLb8cD5SWpDVN5AskHKPsRY5itsB47bYEjCitvNwRcK
         OK0APrXAYOiYqRDkzP9AZehaf01ZhEs4ZSPkmha/rIFC9cUlm1NpfyYUlNmOUUfKrjvw
         DmxuNfE7eLTverGyZHYyet0AvCvzoaW95OGGH9MfsY1CL99YoZTjw5qcBd5ZHgM2rI3a
         nTIICvhOSF7bIOB10M+y3SLiGLa6tpgLhbwUlrCho0Pex45K0UghLkBnkgHNlsVygAei
         YIWw==
X-Forwarded-Encrypted: i=1; AJvYcCXQm+bom980qr9K+zrClTFUnXzPFTdePOY+tThySxIf3vV7YUp+ZXhEvEQwoI52iJXSXZOaL3OGZ/byMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEijgXKMV8SAon28DJ9AWF9j6tS55N+JZvKbwirMy7GD33lzUm
	+J9tKUNJTeWScUYPtu+mryZgUzEOf/5U587Ai13HcfQDragSioujO3ey
X-Gm-Gg: ASbGncvtmA2RWbCxnMDdPcwJqBIEu8YUQNTe0AGsfoOFFyAnEuQo9987DH1PLnqoGrW
	M13ikH8MxcbPXP4j7pKfB3imS11HsvpFUMidHyMLN8YLX5z/V76a3GXJGETTYqae94oR40g8a6u
	5Jtwh1r/WeMp1jtYOMJ9IigLE83CqiGNrLIBga1Iqi2Kj6GMq5U6dobjslqzkpQDtlEe1jPd9df
	g+fwu/eXyx4wwzvtGYlmgaamrm8rqmbdqbHICIbnt8nQjkudQ+CNW7dh1YHaw+DCkTzne98BsYo
	I2DllnVmy3Q2fBI0d/rNGJTgftBYK4UQK7KO2ykCkt+QKNcqrd9PYSoP7408f1jCE4+M7JTK7K5
	h/TNTfzKsJDmue5HbA4rwMKmOoQLI4WyjXpQ=
X-Google-Smtp-Source: AGHT+IGXgHIPGwjBqDVM78HsNs0PblmkiXDMpBXIECEl2ksSHuLIfRokrz6fPJ65rOVTJopiGyU7Nw==
X-Received: by 2002:a17:902:c403:b0:23f:fa79:15d0 with SMTP id d9443c01a7336-27ed4a986e0mr7756055ad.46.1758742233251;
        Wed, 24 Sep 2025 12:30:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821d3sm181785ad.83.2025.09.24.12.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:30:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:30:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v6 1/3] platform/chrome: update pwm fan control host
 commands
Message-ID: <60ecaa03-8cf1-493d-84fb-16c0ae71357d@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-1-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-1-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:34AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Update cros_ec_commands.h to include definitions for getting PWM fan
> duty, getting and setting the fan control mode.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.
Guenter
