Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE142F2A
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711382899; cv=none; b=CDm8j31DeFtRxnq3Foiyj1QDxn/vMkD3+dgL51SrfXVPR12A3WcbZO9IIATKQdd3CGlVGY1IMBXUxbrEur0NBNlMLgL52yEX4gxFBeLytDDqEoEYgvgPET7XfCkQn1CXmmHj9NAlxQrviG/cY4uSdfk9Smc1lbPZ4+SzAmS8Nt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711382899; c=relaxed/simple;
	bh=5oNSUZnalombC2IzEwa9rZCVFZMDLJMDVNMJGtrcKTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZamcOZw0bL6hO7pJLrFDayhnvi3+CwMhgiixrkyACpE4Wx7cETDGVHY+3MazfXQrxLay+1HPxue3cDoFYF0B1uV8A7jSGLhL4ImeNkgk3qIiFX6W8E1BcYK12m82pqGqgGGZs2kvSYY+vbaB4sR8nnd44PrguNJTMACE/4l/74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkanXRUk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkanXRUk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6b22af648so3628089b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711382897; x=1711987697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SodmHMP4SjACKGGtdFfRPaIA/G117aLr5bSZp97SVTM=;
        b=kkanXRUkvKsTaVYuWHyP3GAGEyrQ+upj1qUdZbdUR+WVr7XeGvxJdyDrdQHIrulUuZ
         h3KeuEgo4jvDHjDun5AeAZ1eZ/oOZ6XRq45kI938tJLJcddTMZpBlva4mywk35mIDjtA
         jg54SIZJwFlkEQu2vEIn/VObrJbGuX0pn3ErE+cDJC1bx3rfw0nlFYqkBRvBxNQqvtHy
         UHt60LuqT4h1hlFBrpku18RshBAlw/D5OJ7V/WtU4B3ZbtxUPTBLarVTAWsvcMCqV18o
         pAJGcUe8g1GFqSz8c+ulEPDgWnmFCgLeb+i96ivUqToX2EAd+uv0swiK1+ODSqtuRiD3
         vAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382897; x=1711987697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SodmHMP4SjACKGGtdFfRPaIA/G117aLr5bSZp97SVTM=;
        b=jYsXSPWNwjaDx+gTbTZe2ShKeZfCzeN3/Q+zB0MKboIRgxvhY4fh33/h2sskMiMhjp
         uPNjVXsK+K174392msKkbK7OvmqMmID288S1UUNMSNVk3ToPiHu/KOb7XGswidwEsFEg
         SCezWUDnvAYHniL8L/7Y1ndPILOAN42c7wp3UqW2AvWgm/BJwYrVF+cPN6gzq2hEtt/p
         XVD8ioH99ugmJ8JzSBLuDfY6O88WlpYfmDHvrcZVWDTQcWHtEgi/wsHzsMdl5zS90KXe
         Lh5ap+lVDYTVI4j23CVhn4uYDDcVNRN6LQrxhkpOnEFvGg0pa92L+7W1Q8f/YRdWaBcd
         1geQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlkuAnY/yL2Lwni9MakPiMvuDZX/n3Ly4PZoWdolTb8BLt3+R+pCIfLyugTIvnjCfpcbiphL0Ire0g8NU1FmFkmozK4xpc1ydpUPY=
X-Gm-Message-State: AOJu0YzgWWHMGduG79LkKEU8D/YKiKf5Fuvtd7zUXn0/Xe6U5ulpP1/V
	eEegifINIl4VOhvDKVi2O/l4anOfTUz3jUikUabp6FIdYeaH4TY7vFkz0Z8K
X-Google-Smtp-Source: AGHT+IG4zmzEL42E2WhQjwMGUUAiR9uJLIqTZiEHtF77xc1MYcgnR7mLDHBsLYspMOkzTY7xLgvlhw==
X-Received: by 2002:a17:90a:6c02:b0:2a0:3f0a:a863 with SMTP id x2-20020a17090a6c0200b002a03f0aa863mr9600632pjj.17.1711382896698;
        Mon, 25 Mar 2024 09:08:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a788700b0029fefd2df97sm6490708pjk.32.2024.03.25.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:08:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 25 Mar 2024 09:08:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Precision 7540 to fan
 control whitelist
Message-ID: <3ce4861a-84e7-4b57-9f20-f710e7933852@roeck-us.net>
References: <3f0d7398-401e-4e7d-9f48-0a6bc0034c28@roeck-us.net>
 <20240325045913.385853-1-snishika@redhat.com>
 <20240325045913.385853-2-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325045913.385853-2-snishika@redhat.com>

On Mon, Mar 25, 2024 at 01:59:13PM +0900, Seiji Nishikawa wrote:
> Add Precision 7540 to the fan control whitelist, in addition to 7510.
> 
> Signed-off-by: Seiji Nishikawa <snishika@redhat.com>

Applied. Note though that sending a new version of a patch as reply to
an older one may easily result in it getting lost, so I'd recommend not
to do that.

Guenter
