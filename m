Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87657143C61
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660780; cv=none; b=Xa2b4pA6ylN/WJoC0INlLrCwYgQ7kkLNcRUEy2zTiCuTaseFAFIJ1g9WpPRdhUoA/lQJH68Vy+8estEGXAZWSN9WVWkyAh1GzXsHhhhGh47+11n6onsDgIboH/FmRndDqLHMIAE7KCWb7eTX9E66pqs30PeLaIfm/UjZPnq3PRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660780; c=relaxed/simple;
	bh=PYuKCOV6aj1XU3iT8oUN4z7XzxiPHlZ7vT3vAXmH8vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQykGwRHX4DrqSORtHzLsQ9WHtXKHYcNa5U5d/IJ7RGy8Z/qPw4+POlI1p8mjWg1lvD88/mQSD0a7NAsZ2D1TbSrUi8+Wno0GSGoC9ClRjWUEDh3ysfME86slPPoccB3shzfFvdkBQkPFm0lEIDUVm+pmlLdXggwLJIUG8tx3cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrrNt4ks; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrrNt4ks"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12336f33098so2407725c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 06:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768660778; x=1769265578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVFY3MiZAadIU2C7x0dHtyl2S8hyE8MpQnzv7RYPmhg=;
        b=LrrNt4ksoUZ3ZwcEE4OCU40M/yMUcc+Um66sbja/34j0e06I4vValAWXVzNE8Kys2N
         Kbu4QMMzvkh1+ekZXwke8yKOzzsmH0bRwgCApGFNR2TZf2fgZ5nYDNpLeOas0zKkXgep
         gdlANO/Degcy6C2JZ4MfkFZ5QGz9PiU+1l0nFCWkCq6AcBX5/S2eSBqd/LazRSHMC1jh
         DK/57W81rYNAImZPgwQhmUjwhSRC2vBfqXo+/sNDmoJ6rVqxtvZqxxe3ghKhEbfhk/z/
         w8K4ExnnSj9QwDzslugG25mlLY9cBIXsN2F14OMoQPB6rXiD2d/zf/H4oy9148qryOaA
         kgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768660778; x=1769265578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eVFY3MiZAadIU2C7x0dHtyl2S8hyE8MpQnzv7RYPmhg=;
        b=YEFmifT1Dx63nRcH2fzIMq0cx21iVh1I9YQNToFziKc0KiOyOaQup6zxEax2/1F9Kw
         QztYU6ThK6oQdL+BsYj6zRewa+3++7a0HPmDB2nh4gl66E0Q6emddiFosNXdYiXcx0J5
         hiIUO0oAg7EpHI+gbhUrtGGdbT+qavOBKozALY9lvUL/8CiDbOSfJIanwxkt9eNCg4FE
         ZYV7aM+k/mhqwGqQAndX0EHvRewhqI0JSqdZ8NPc7Rh+/QsEuz9oKfIxecsWgB/qRe8Q
         JZWULyNoPHEvzgZ6siTHE0dfEllKdfLCArMgrsDpZqZjKYzULVvv0TKbKpbbnQVNX5ET
         sTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCeiWWjOZCFIOdu/9YuqpY8FncrdzPD4F6xvuw5HjlvuqPWhY0u0lO1Ctvl1kyMzLjdMo7vbdJ0uojPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIL+oxMZ1vPfDuK/3dJVggG6lbYzBdY1VySAO6aOeUMf2puQlo
	NUsazEm+/HdI7cQodFrZueGo5v8aFsIosHm4GjaOj5pXUtc+xsJJt9WO
X-Gm-Gg: AY/fxX4zLGvDPm3u/MxlDe1HDMR31kBA7jvGabR36e9ZupBSQOa7f8a7rAxI9ezIjMi
	eDtTEdWGbCh1SjqTMBejd8hWbVhvA7U4UVgl6B7zFfBkpe6km9dTvwFCkzir/hmShiqczPoZZ9K
	DFEknLdnncrEXVmd80ntmoONZvQ4mvuaisiQlR/t6XRncF8gHR0A9fNMgiuqEK0lAaVLkbRL8Eh
	+/iTMOVE7LXSte1JpBZ/rzSKPvCi7I84Mw52p/Ves7hBb6KAnoIPTONh2uqjGr02kQ78GavUDcL
	SYmyn8//aJz7J3Ncw6UxQE4BWgBpzOLxyLCdet4vVgl8UdWV4jD1wC5q4K7Gc5M95mJYovhUtvV
	gV9LPyxzZ7BfuXl5M7siDWmJ23mf+uTAGs9QUWp6ybADA1M3qKZbmEA8m8KGRxj/MjJZ1mP7Fhg
	KwwJxEPPu4cMEBB25JTbqJwmEk
X-Received: by 2002:a05:7022:e16:b0:11a:342e:8a98 with SMTP id a92af1059eb24-1244b282f14mr5315065c88.0.1768660777529;
        Sat, 17 Jan 2026 06:39:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c0f7fsm6066983eec.3.2026.01.17.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 06:39:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 17 Jan 2026 06:39:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "benoit.masson" <yahoo@perenite.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/5] hwmon: it87: describe per-chip temperature
 resources
Message-ID: <0a4bfdac-3f3f-4dd7-87ca-a4edb58d2bdb@roeck-us.net>
References: <20260114221210.98071-1-yahoo@perenite.com>
 <20260114221210.98071-2-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114221210.98071-2-yahoo@perenite.com>

On Wed, Jan 14, 2026 at 11:12:06PM +0100, benoit.masson wrote:
> Add per-chip temp limit/offset/map counts and wire the driver
> to use them.
> 
> This keeps existing chips on the previous defaults while allowing newer
> chips to advertise larger resources.
> 
> Signed-off-by: benoit.masson <yahoo@perenite.com>

Series applied.

Thanks,
Guenter
