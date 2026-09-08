Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FF756C64A
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884402; cv=none; b=NJfWqcmgPxRumSTgOPOQyXVFrW9kn/nYWYYrPXcG2CbB4ZhdLFyRk3jhtFk8O9WaTBY+Wo+Enk6mJmmWrZmkKvGGRWojOP4WW/kSoUwlbLfXwNBukZFMW6VN/IWxxBXklLHMwTLPHyJwkjIjGZ5fV5chCym9jDHDMWGpTQa3YLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884402; c=relaxed/simple;
	bh=X/OoX1LRDdQm45XJJkw0SdbbigCXkL5MiOCHI3Hx2vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwSJvvWOG0Iijn7ph2gECDjOcHo8/pKaVeMxAVU8sYG7igNwzewTtY2+g/EV2+/D23DyYNrhA45X0RReOxBqIBivUrDikV3T7zBy/1IYlgYQ533gu+MmyIyc+dSlYXqVA1inO6GRgwAgSQTZitZVKO7utx0Gvx4UIvLiBOvwH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koq7Qrxw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koq7Qrxw"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398a5aad413so3732604a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884400; x=1789489200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sVQ0vLo+31t/EjL9dyStMFp5X3Ak22HAxZtAG3z1aAs=;
        b=koq7Qrxw2sz3KopT6/poVVEGqjidokbNC2fZOnsgwrz4PlTOHXrn5Pzia9nnKZb0JU
         PUO3YxXDiLPLjUjByOq4gr0h23LWFbp2s494bW/rfwL2DjIiQFZtmmbHGwSDmoGfH3mY
         r754oJai3HFyKZ48bhQrlm9c60fx2r5ddXJfJbAzEuovM2xLp6jB/cT/qdKoVt/u2FGU
         ffLxKCB7eFv+6DSJDFg7kcsw9EYnjGsT+9S9j+d0UfpKZxFBSIzUBsfi12EuG2lbFNvD
         UmiU5cBn5O4FzNWp2F9f/0x6YuIVMu9JedllgAlQ8ixrV/tp7rgSBT4ojCVwniugf+B7
         wYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884400; x=1789489200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVQ0vLo+31t/EjL9dyStMFp5X3Ak22HAxZtAG3z1aAs=;
        b=svpMm6n5obWXWpoLkONt8HfvjGpD/OdXHUo6rOD2ZMev26v3wjdKjs3VugB3nQj4eY
         nF/UhGkWv3eGhzdoMPqrTckuIAVPXrh3sCXEa31fcCXqbhd661sUivOAQSSdtnsOr352
         zzaBzBvF4bTpMHaGzVlUfYfd9OX5A87xmKEHqk+JkUaaCg502/4YUABGHMkzrA3SGrIU
         C4D6VwIyoxNSlf2Jxl5b4qSq5DYmiBszLmVsW96SCbU9ZT7dXWJX/dD52niqa8xGygVg
         YV/JEnsLf4JAUOHWVbC8g+JjfBoKf5Vj/yXdCmNR5hxaK6h0TE0ckvD6QAZfbJq3i3On
         Ljyg==
X-Forwarded-Encrypted: i=1; AKwUvBxTIWn5iMNCswE+7y3QYr4pBcflGbr/nXxDi9WrnREyaaiLZlrH9a06Trf2b2SCTHa/gR5wjlvWL3UgyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lzMTKQmVdLXw0M2Qv7jNT+kx8MLr9TQ3EiGVHD6D5O94WEwMGV
	etd9+b0NMDBarX+p7QKP4kjzUGq1p6Liu09R0h7/baBDM8UhrJOcAauj
X-Gm-Gg: AYBFou0QcUvEP1CoWrAHoPBY47HoJxozZ2Jxc12fSSlUtIaFxriJ0KCfSByqxpdeX8q
	Zmz+e9+Ys/SE+188pra46Udi7JgNyswNwo+/ipDVmXW69Slqowd2vPoCHiU/h4d9S8nLfZG2zub
	1yLhq3ixjhtevF+N4UUX+RPCiWjWrPFxi8pyxOI1mvwhuPPt4e29HmsDHY0Yevsuu5FuCNclAXN
	fhPHZ8TCQhitPMva/fb9ws5pBs7yF/S+syamSxFsKR0B05vezVInTIZlq1zqNqv63nS5vlZDA8A
	bcQdVf7vFOOpRfU1DpboXbhzchoNn51OgdQL9Lav+yWLWtZW0L2dgBE9Eth6dfMkFRC/x1Xw/R4
	YqKN2kvgvYdQcYNr1umGGbI4HJcllS44fBPzSzOZh9+NlpE0ay61WXqZgN52PuWEF4fNKg2/SGC
	99im95U3zN5yHEw5v63nmT501XsFOLkwHsxb+VP2TJrcqPpnwJem3C2Hj/OxY7iAEjkQSntA5cU
	g==
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr41629884a91.21.1788884400221;
        Tue, 08 Sep 2026 09:20:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm32856991a91.0.2026.09.08.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:19:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:19:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Synchronize HID command and
 report handling
Message-ID: <5476a2a7-77f6-42d4-a276-89f60841d9bf@roeck-us.net>
References: <20260904022129.97896-1-renari@arimil.com>
 <20260904022129.97896-3-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904022129.97896-3-renari@arimil.com>

On Thu, Sep 03, 2026 at 10:21:29PM -0400, Arie Miller wrote:
> rog_ryujin_execute_cmd() holds status_report_request_lock while
> reinitializing a completion, intending to exclude raw-event handling.
> However, rog_ryujin_raw_event() does not acquire the lock when it updates
> the completion. A response can therefore race with reinit_completion() and
> be lost, leaving the command to time out.
> 
> Hold the lock while parsing reports and updating their completions. Use the
> irqsave variants in both paths because raw-event handling may run in
> interrupt context.
> 
> Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

Applied.

Thanks,
Guenter
