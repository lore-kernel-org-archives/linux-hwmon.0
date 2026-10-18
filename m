Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6C4D6C29
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340788; cv=none; b=cyVNqKkHqIxyq0MwKOrv1GjeC52ZOFJU4W8XUNjvJgnO9f7RWdw/EQXKbgsuxEgCluoopiLP6X6bCC6H/1w6lirzCy8zbmzQwBME3ZUImOh8GtIma4hGDetosMKqQjQzeOT3pYtJedW/AoQrKNvPfK29hIP7C40bZUOUSADzrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340788; c=relaxed/simple;
	bh=G4S1n3I+vN415jixgniNKq1lBfK4ap4+2xCFZJvljTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLCRhSa2i+Zpg4Z3nUb4iEg/TxmF8QRlSsMwqYBvE2+vvZbUD2QCGexTr2yeQ92qvyTFi4CnTwKwvQsrP42i5wIwq6kdr2qIkAWS/zm2xHQ02x6iRot0a3NP4dG13r3qaQx9QCxPdgqP8IvVlBANaHeURYvvwZCfuLR4ofWbaOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3ipWvTP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3ipWvTP"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso973818a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340786; x=1792945586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r4CcxdQ2oJybJSNbjjXimwSvVRvmuOa37brscnwQTP4=;
        b=s3ipWvTPS7U8hkOE5XRzFbEkyhGh1zx0IZDL6mKYeUaw8yLilO/+a35SVpvc1gs6Qo
         RIWx8aAHYJYa3B29rWipZXYB1t3377vMWgqsF8yTITz4Pmbp+jNryGBWrMQdvpGlyFng
         1n3rWPhu/M3wDFS0LgyxrfAmhMQm8XpPIH4jCQKvCuGqO3JoaxNK09dP4wiKyk4ixRxX
         tak7IQ/0lT996uyqIP0CIPrs9kDkbgXkoUSjFx6tdRSvcgUaHxFmp5YxMy5AM0akA0+u
         3TwkQZukKd5AM0ZijSDub40bEaAFMpwsfhzmi8Xgjwq7VKXES1NyQrNxTKMuRxAuI9uQ
         QDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340786; x=1792945586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4CcxdQ2oJybJSNbjjXimwSvVRvmuOa37brscnwQTP4=;
        b=TiHdhscp2WTnEHHrExtPy0MMJ+buGvHTrBPssF6L116pDX+JpmPZaH/IBQf3eS/via
         1nX541kfQP/E7QnNtxzYI3d/BGKnq9FUeQQx6X7pwIhs1VsxOfyzfK0BYnFaompa6qUb
         Gp+LXxY6VF+hdG+kStHviXyAv7PY3GbvSDbNKg/7ShkMkjL7IkMnM+CwPXCKEgoBEGO9
         8G+OIhOL8dfJxs6BRdV4rSEkKFRYWwmitr37i3xwNLIr9J+HhQKFWG2vlLpb1esXJgT+
         fBUz9gFDd2JRauCtamOD3KGb5BUYhrzwP/O4Fv4N8gBPLgv+WahXSJk70yL2Vla9vi/o
         al/A==
X-Forwarded-Encrypted: i=1; AKwUvBxdppTGVMf0ZPe1FD/8Inoe3qbkrD6tyeMK7MpvdCbeMviw5JzQshbUTCO62hplIa+7xi5XMIAanwHYYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRIryNHxTByEupF/9d60irceVtrgUT8jj2l489kHls+8psmv7A
	dT2tGdHVevqSpW65z37gNb8+zliNRHyTcXSuZwnFbkTyBsvG3Hg9P+lK
X-Gm-Gg: AYBFou3gQ0kHZ7BRz6fsRxzM1yIKnO3bFhA1uH6Jb54Yc9+9GacDsJxll5u8x2+aPPb
	4n9NiiwQfgZAoJPddRZSNnh1/iQ9Lwi0yO6Fx7v0AfwKjdEmhVMEArzYce9ZcYUiYIwkM9iy3sj
	FUl/jT1Jy9nKfUlFc+4d7K5rGyqqlL8TtfZVeYt+KZ8sJPcj4NQVFnc9jJoWaMMWPyVygKhrAhx
	s+geAR893r/WG7r1+2L44RHFheus1jNPtF3A5uex3SdQxDV41tVkqCGG8pbrQKIwwkVQth7QMaa
	8it/msqpCxl96/hpu6rx4tMlcMbcib2q81NxguzFGitxFD5ugLl+Lam66a0PdAN2Ftp/qYHzJqs
	4KEg8POVUssZwYYg6WZUT97H1cdhJQQf7gfC7dizJ1X3SSbpdIxrnqT7Bn4dCMc/WsLSZb3B5dH
	K7wvZv+pA/xqTgsN11pMZQawhJ+8R7obAwn0dsoMTa0f0H0hM+qb7IubjpgjAFVbLn9nj9o2Reb
	7l/nLDrK+Zb
X-Received: by 2002:a17:90a:da87:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3acef19656fmr4952624a91.30.1792340785847;
        Sun, 18 Oct 2026 09:26:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1981sm12210945a91.2.2026.10.18.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:26:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:26:22 -0700
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
	Aaron Tomlin <atomlin@atomlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: Replace __MODULE_STRING() with
 __stringify()
Message-ID: <49d1de69-ffce-490f-bbee-80513cfd0cba@roeck-us.net>
References: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
 <20261002-module-string-v2-1-fc7438acaf4d@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-module-string-v2-1-fc7438acaf4d@suse.com>

On Fri, Oct 02, 2026 at 10:31:01AM +0200, Petr Pavlu wrote:
> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
> MODULE_PARM support for older modules" [1] in 2002-12. That change also
> moved it to the graveyard section at the end of linux/module.h
> 
> Replace the remaining uses of __MODULE_STRING() with __stringify() in
> preparation for its removal.
> 
> Link: https://git.kernel.org/tglx/history/c/136839a1b4 [1]
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

Applied.

Thanks,
Guenter
