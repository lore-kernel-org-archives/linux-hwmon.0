Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669E577E55
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097721; cv=none; b=jcFjV9tLAiea6HZf/TaMG1kfVNwGvPGUFd3MNhaETEAmzku+vDWqyHEoi3UIp/qRyk0Bm0zatePLI3pfDbPQIZkmH6dlpydJpGxeMFgOj9sWW1jAH5fgkonvUBvNoX/uvdnX/y/D96PfvaANkKGABwx0eKdIPhn3f3yx2iV/Yxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097721; c=relaxed/simple;
	bh=r9jsv8Tj/NRGRSHDpREVf7hC5Izki0ZIYbPt+RpePlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/oaqeY7gcZeB7yIQM8rT+dK702brKTYIIq5NJSDr+/dJQHI2zWdL49DNxlfGRv/a89VXMVIk53TyxYJT2o40/AwysmjK6j8gtzUG/T6oqaSYwGd6SPeXaJJvEIUwYAlulrsdmq72RsHyb2F6ivG/K5iVuuRRRQWl4GuOZhcjOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdEheXsK; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdEheXsK"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so475295ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097719; x=1790702519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g51CWbLnarIyJ0OhwzK8Z/JluNHOA330HfdYyzEXpGc=;
        b=EdEheXsKdSTu4t3H0cohiMqMZFOwP85n1ZIkFKeBG2BJ/QHoe/tlaetP3McRWwmxi5
         wG2OIsh+DyhS0F3RpOoBcHE+WQfoPuu5Gmk2rsBUJUpv4EQDPYpiOjxQpKcXiBOGsGDl
         hOiW6R0oAQXXx5u+COYqDaPIBc761UiWxHc3JWJ07Q8KugpRi/bZN7qYMINHtPge7GRA
         /Cmf4tMoxC945/u4cbMw2EGWthtlKcwAIA7arLsfEzXeUNtXCuQWZQirZGPM4gVRsPSI
         0XHzHSM5c9kDqAAwsYY4c/6JNeRf403aMpA5POqx3YP2LtLJIV0IKiAP7f/7ZhgfjFId
         xHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097719; x=1790702519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g51CWbLnarIyJ0OhwzK8Z/JluNHOA330HfdYyzEXpGc=;
        b=kgqtNzJ+/2Eyiyfd1Kh7742HCHMZrt9ZWihu9fgeqPgsXPzMkk0gZ5Md223UdBrkaH
         mDqY0hyB7PqXDBST9BAlsO93vrKHFijK0qN0Vr7ZIKdKsDqGLo9e0Vb3NUxs6W++ao9+
         4hP4fcAiakibXjH7gryY7RKiYFCigNF28s5vp0xOK+h5mY7Fg8vbaTroC5iPK3ZA5FzT
         TmFcLMhpYs9UjgJvm+bwf0/h+7p3u7/KV2UM/NtVmHEsXhqCyrOHmhmU9huVHVSP+wzh
         ieY2FgnEP1ZlNkThJeP0lqKLulEkIHmuOaH75e1rTE1yfdPg/kk9bSRipI+WAvHoAr36
         MWZw==
X-Forwarded-Encrypted: i=1; AKwUvBztNyVmjFXJK4Lufq9YK2y+y4zPSLTRbjaxElud920J8Oew/QdCLtLNHmBxr43h4N16TaecZ6DaaaEDsA==@vger.kernel.org
X-Gm-Message-State: AFuF++kidKW/vL+3hWoNW+9F0pLSJtdqSpdxvtXBLr8e/nrA672nkyGa
	Yp1OF0N5xSXyKlCqEq2tcBInOIQsNsMFoadVpa8wec5pasDi+hyhLrNd
X-Gm-Gg: AYBFou1Qamf9/ZqoCdgA0glgoGpBArjj1v3sQgsqWgrpngt4MIWqXxR6qxRPxNEj/u1
	R7HYXa/mHkrF3m5qqZGCKZszfyDRN+N5wWKWj5tXB6tBh2RyZ7ppiLnxD0R8Mui9x+wlurJ71G0
	k2Oyj35bi6aYvmDHjom76gFeaUX3mnqfGDn9Z6AibZuc3d8IzvxwQ9l3+DcT85BbymY13FcPBmM
	1SOTEnE6C+f4ZL7/aa6PA9AyP3Uk7qISJlHRUNlQgl0uErUt8uCUlRw9xBlJ8Sw9o1n66OjY1e6
	LBgL8J0EaI8YBJ2a1sJ0ZSvDu/YoBcZ/a9Zr9wvXlKPaRJ8OIiOD1Yz8x/s5Nh0R40QzxS4LWq+
	nHn80Q0VF9x/tNSz+Rwq2VH3eYSB617b/L6xNMwgU8gyQYpu3APyBhG39kij7w3wkCYzwTs0v4J
	3C9tYnThzl6bDcTSkzWxOtjZohxH7NWHotvjHWQTK2Og/WsP6FLHygukIi8mhJLFaoeY+1a44PD
	LJpXNrnKTO7
X-Received: by 2002:a17:903:228e:b0:2dd:ad73:c984 with SMTP id d9443c01a7336-2df69d5ac91mr681945ad.28.1790097718673;
        Tue, 22 Sep 2026 10:21:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm13644575ad.50.2026.09.22.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:21:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 10:21:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rudolf Marek <r.marek@assembler.cz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-watchdog@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: Replace __MODULE_STRING() with __stringify()
Message-ID: <cc03390d-8fc7-422a-bbcf-93bfbb82276f@roeck-us.net>
References: <20260922-module-string-v1-0-c18766690185@suse.com>
 <20260922-module-string-v1-2-c18766690185@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-module-string-v1-2-c18766690185@suse.com>

On Tue, Sep 22, 2026 at 03:32:22PM +0200, Petr Pavlu wrote:
> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
> MODULE_PARM support for older modules" [1] in 2002-12. That change also
> moved it to the graveyard section at the end of linux/module.h
> 
> Replace the remaining uses of __MODULE_STRING() with __stringify() in
> preparation for its removal.
> 
> Link: https://git.kernel.org/tglx/history/c/136839a1b4 [1]
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  drivers/comedi/comedi_fops.c                          |  5 +++--
>  drivers/gpu/drm/drm_fb_helper.c                       |  3 ++-
>  drivers/hwmon/fschmd.c                                |  3 ++-
>  drivers/hwmon/nct7904.c                               |  5 +++--
>  drivers/hwmon/sch56xx-common.c                        |  3 ++-
>  drivers/hwmon/w83793.c                                |  5 +++--

I don't know how other subsystem maintainers want to handle it,
but please send the hwmon patches separately; I'll want to apply
it through the hwmon tree to avoid the potential of merge conflicts.

Thanks,
Guenter
