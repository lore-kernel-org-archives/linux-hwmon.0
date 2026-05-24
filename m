Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F3139A04A
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779636682; cv=none; b=jFmcqmaEdhDmiUL9QN3oooJGbulRmGfH+ToLhp2kZiJWGn7xvkbihCHRTDVzYLSioJbp1YKD4UpKgnZoCyyrrcFr3n/ja/IrKDH1iOryPkmXzOJtA7hEIJ0leBnF9mKK+8lS66LwtE7fQc+K4ld0KJotENcc6dt5rHrAtg8u/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779636682; c=relaxed/simple;
	bh=bWEeZxT3GI8+NqbDwi+VHBUCvtAmWHSDUEdha2fNvO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYota8Qt0NM+rWfDlRcS/YONhagI3b5eekER3LCpVIfGU8+g958TWmNXF/YASyGc4Fm1qn/wc/G3vO8PbdmudTvQoAVkWhpYj4cUTqSIWrMC07JYE4On9Iwa15EfaJlLr6LGFPOOOOQqc4eO9u715EpVlKTC/G2bgmbb4O7Iu8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAnry/ec; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAnry/ec"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3042dffd80bso5370021eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779636680; x=1780241480; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adjj/RYmwJajC2gc+J7K/eeOQQFo3I8MgV1mEU1+WCY=;
        b=iAnry/ecD5H+XMST7JrPzZoiTIzNJIrOK+s+4V1neuHN65Ms8NDOGXbnZLYf+n9d38
         7OWt2/E1L7WfuSpqZ10yfjzdNGH3JKEMjRz7KM6HvmQSmOWvPRg6grAvcOIFRDPWh0OA
         eSvKwNyUCvaVBbhozMoQ4sCdJzo7NMI/zK1gy/WCv0ie9AMaXy2JYnDhEGUiXJKa8/4k
         hppKvZj9rLtynDmqIaitqtooYjK4HJqG5lESRFAycNYZ16INsvohYF2SMXuJVUM4hLf5
         ddm9m24yOD/MRFD1Sx/yVnrGjW22AzQhYLmtt8LQ3gZeMGGVc/kexr8pAJgMuZa7Kc4z
         TDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636680; x=1780241480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adjj/RYmwJajC2gc+J7K/eeOQQFo3I8MgV1mEU1+WCY=;
        b=GdbbhF8OiekmSPbFpISktx7MtVRitsRpCINNF+W4Qu/Fa7BM/dUka983WOAc26Jadp
         FNuzEK3BMv1vBkpQpf5DL+ht05hh/25ooKnGYK+/cgqMfFs5sqq5k6PMo7+XtCh8hfHY
         SkNxvImnmL6UuuasonyBjc/G0xQF78xXyWjxZWca8JYZ0Mqh+8dVZ98vAzhiIks72fZ2
         KHfklfc+HVVQUxjdoRegMwaYKgGZ9fIwgvuPNSAhKLeQQILJDc2cOLt9mgqszvnCEbPi
         ibUyqLX2+DEZPklltXylcEJ64aQokBmdMM/oEmt0ERa1kAlUmIUHLm6PlLaJHs2tahNW
         7dzA==
X-Gm-Message-State: AOJu0YzeMG9bnmagkQL8RZdOcplsmalUkU9msLcGMGCJIr0iDVqAcnBZ
	p8dGw3J03iRJZX2WqqkhKZ6PYElDSxtePfU3ETEUhlhG68jHPfn/3D2b2e58T+lH
X-Gm-Gg: Acq92OFQdHHlTwKrR3uIqdZLwB/RZlNxOcsaQcfsSemRuBBATqyX5NzwQXaJlbU16eK
	fsJ0ysa+jnWoJPNwMFln8NEGO5uC4tXH3vmzrBCNbjNFMi3Bv4sIWd9HQeNio0qG4C6hRLhZP93
	mxpDefIlEIAbcdCc8qjk/UsjSYgFs4jhJ6bIuRtjrVCS4L/eLBuWL6S7DLYCja8zMO7AdIBBDnS
	YBOdK+rI8Dfjlq3BJ+cDqyyeS6VltRrjlcM5jd+A2MUMv8JFznyZJRlw0GHX5wbErMtNJ+YqeXJ
	vVAZKqwvRMJwB1w7bje7rSV9aYz6Zowz2BIXsChKA8oFTxzX+JG5SZeKKV12M5iPv3yBPxsfIOT
	sAYzI9ZtKVWdHZ6gu0M1Bwc5ACq9j4vZicApIvE41zs6AZXIdmwmPfxIvqnwE4RuXbTZdeLDUwH
	B0Fd0PiB/zZltWSJGL5XVkXHW09y7lAdvnx803
X-Received: by 2002:a05:7300:8ca7:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-304491d4ab4mr4808640eec.26.1779636680364;
        Sun, 24 May 2026 08:31:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm5986289eec.21.2026.05.24.08.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:31:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 24 May 2026 08:31:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Reiner =?iso-8859-1?Q?Pr=F6ls?= <reiner.proels@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add support for ASRock Z890 Pro-A
Message-ID: <1dd0104e-6f5f-4cfe-8633-787514951f19@roeck-us.net>
References: <20260521212632.223724-1-Reiner.Proels@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521212632.223724-1-Reiner.Proels@gmail.com>

On Thu, May 21, 2026 at 11:26:11PM +0200,  Reiner Pröls  wrote:
> From: Reiner Pröls <reiner.proels@gmail.com>
> 
> Add the ASRock Z890 Pro-A customer ID to the list of supported
> boards for the NCT6683 hardware monitoring driver.
> 
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Signed-off-by: Reiner Pröls <reiner.proels@gmail.com>

Applied.

Thanks,
Guenter
