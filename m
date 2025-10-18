Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA41192B75
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Oct 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791761; cv=none; b=uz7RE3n8z8iHJn08pZ1XbanbGN1pyOICAR1cQQ+TtZnFyfeZVVsLbpVmbQUCC3kMKDqAs3ysxqldTYLOPldx+hRROEyLRmcIRX28YSuW8TVTy5KHmt3dUeL9kcP7ZAO/1e16EEkqC8QSmw589fxvFRPcTpFEpRsbtwORzd59kFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791761; c=relaxed/simple;
	bh=4MTBUHheRoqjhOd7BBqxKj4o02h2M7yKv1+pjK7zjNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsocve03ANnR8qQzmZFR8Xxvdp0V3CJ6fUKVXsvRCbD0/lTP/9kn1ROQDWIKAp8FAGYYMJpCMvAZzs8JTpg77dQvzg28Aw/tRKVjwBYAG4OWNyPAnMvtIw5B7bFMV4aYkp+fffW8UqYvMgMuryw/Tp+rvCVuULgiI4Wmn1fQSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDKbV9bK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDKbV9bK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290dc63fabbso15450605ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Oct 2025 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791759; x=1761396559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNAClAvOnKjWB7HSzhh0yIx7GLLOVFoEN9nJoFbnxAc=;
        b=IDKbV9bKO+f04b0GOzAeXWpCiGQBfkLUB8Hqb8eG3fFSVZev9NVYb7bHrYIYfajgzW
         RZjapFS3TVokfOPaaW7bVxMucyiyRpENAgVGFHdxjx53fM/H5dZ0JStAlvqIA5vWF9oD
         HDK4pohPAQ4SGSDUOcndlLvcopheovBSnteYuQl7+tuVDMZ5czlr/YHpze0yzeDTCykn
         lTxeTktgFtp/bNVKehYMCcmZPMHWfxPmPgwuQaCrwBePoOE1MzgXBpIRB1OVjY6Br8vg
         tzAw6I5Z7cXdqjOmUY7PBdUs55rVo+xGSmnYObz1f3r4DbYA6ICn9vf/lCNgUBeZBt0q
         gjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791759; x=1761396559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNAClAvOnKjWB7HSzhh0yIx7GLLOVFoEN9nJoFbnxAc=;
        b=uPvPk41xNXgsfzzn3bx5A7ys8nhC/rGlQHgXf+cYocBFlgzDxZKfLwq4XMvBJQ3/7r
         JrIEfTwtXWr+G5h47o1ph4cmVRrwf6dCadS0KrQnK7TPmWlTxDSz3ooXu/rPlHaezlFP
         lzzpdEHdX40v4a0tK9rtkHA9le99KAGywGE04R6sZDnzAPUqjXXBF49tC5/0CuYM/fmY
         Chl/xS1STlHUafqnTkIR8Ow/FOtw55Jh4mvprd9kQXXWnfKeNprBjVhFU/9PSR0A4yJM
         wC5mrdm29gHsOGCyJ8BoSEdoECCFtRoztXTSx29JQMNHlq5fdXHE1h+wr4sJprH9bBa8
         8SeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1qKqW1nQZcTD1b/FvyAhrSQvpqc+nm3Mb10GCoCbnuwdiS0f4d8aJJplcdq2aqJGyLFDkvQLUAEYlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHMoJjKaqk4j8nJQb6roUKPeAW+KAPNmEhR3U0AFB6vpLcuUEy
	FSBV1hrHvK03xKUoAb60an69PJ64v24NHQbkbnIEfl3C3B3ftQcUlP/X
X-Gm-Gg: ASbGncvCK5BM7/MRj/RYvxEeeRPrrGydfVcHrE9gtcpLLdf8DFwcBwZ54uZK3lglo5W
	ChyaSA6P6bU4LeY+5rQaLWOnPSARrjrFTvnOryUyYoAZtqPTF8sCoL+izfJlRp0x3Rumgljadbo
	9uVlyoomvuH1g3TlaD9ICO8HcD4lyfiXsUCHMdLXblEcNylTnv2nqK/tcvzq8GOdBhK9Fr/HuTl
	B3Wn57Al7me00QvTtWNdkCzOyHPU+2VewAfH3j5QAtjKWq3P3k/EFidB+VPteel0BIfU4V6guRB
	cFKqNayiAmrQ50hJjVq74/aSzU08egH5OIQiIBVSsw2jFyXgYFH1LOpilBoiUtj+nqzx4/LeakF
	cE0tcC87X1qphzAVwI7WJHGYfNKprWf9F/ZlbTkXyfQ+geR3aPC7ZD0AelpBl3ZBslQsvRjm1/6
	O+HGonFw1i5TXV/KJM+OeKfHM=
X-Google-Smtp-Source: AGHT+IGwvhlN1brRCS1BniG2CAvahGot/00JMhfB9nXhMtLgvouUhBqkuQKg7h/T0YyFAsClGr+64A==
X-Received: by 2002:a17:902:f551:b0:290:dc5d:c0d0 with SMTP id d9443c01a7336-290dc5dc3d6mr85320885ad.49.1760791758880;
        Sat, 18 Oct 2025 05:49:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df5c142sm2564379a91.14.2025.10.18.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:49:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:49:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	khalid@kernel.org, david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 1/3] Fix broken maxim-ic.com links to analog.com
Message-ID: <4cf1dfdd-6df1-43e8-a396-eb705e46aae7@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017154755.32105-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017154755.32105-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 09:17:47PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Broken redirects fixed to their proper analog.com links.
> Fixes warnings in 'make linkcheckdocs'.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
