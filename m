Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367D157A48
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Oct 2024 02:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728958495; cv=none; b=Qmofs4JwCNgqagi6NmDA5QY+K03uDJZm98kFSOsLbyahdD/D5wBYloFm3mtkOVH6+MV52P2Ms/45TGJyqmA7ksCd1zcJdK9ABAWiV1Dz0BH724R8vc2nWRJNht8KErsocGMHQTuUab4yRyonv8zHRFek/pcY5yaNLK7NcwymID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728958495; c=relaxed/simple;
	bh=+klKLksD3llpDIZGL/YLfktcNMWqtVnPbjjeIVjEHqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcjEr9HthC0hGg+R1iAOAcDBb9yU/1kvjydUs1pshv2zFimB6jXtXuN99Ea0Cfqhfq3Mta5o/ez73HUm0Rcwj8Nu8erKeyM4UVGkH9fuhbKcqZ/1g/lHAOn0N5NYlcLYy5Nhxr/qHI1ESMyJJ2/X/aFidMDI/dLhfDIbZXspDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guE2Owm9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guE2Owm9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e31af47681so1910645a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Oct 2024 19:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728958493; x=1729563293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJI4rqWnxGLlA+wKoBKrPTBsVHrgJOfd0bB3UH72Ziw=;
        b=guE2Owm9ZscJJ2SC+WahnfWYn4N17ZutT8fVznsERqKduW17QGLbZKCcTrAhvGpgNG
         VyOaYUHvP4YKaVdAkirpBRvrcaUSSG1q8ii97ol7nWGDyYXrYHgV8tyKJZKEElYxRdqE
         TebuVajX9YAsRPEPzLnJipE+4EnYqlvuX7a8jYAgH0qXCCgKkakhUvDIEKW/oSpcKouc
         kkWd2MpK5qoWEpBq8cPENWr1W3l/N658ImxYPKnj8yaY9/xpsCA/gn0F+7VOXfoUZlgm
         vFCBOjCBfn77ija9h553NMf4jvn7a7LYdg0pPoYiZDXneH91Lm9YT27wL+ALTfciwmtL
         vQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728958493; x=1729563293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJI4rqWnxGLlA+wKoBKrPTBsVHrgJOfd0bB3UH72Ziw=;
        b=vpcLQtodDDMuLzzXcEmiycpL+GstUTF+1Gcz5gm2wjN2aY9WhwHQ3cc2LPuLmO1u1u
         DfRso2aI2IMrMJSINtppfMwI6YS2wkBRpzdMnKuHYqJbp+QeEsGmLB5Fj8nhjhgvYPEB
         ehLezL1ZjOjG9IhKHEJTo7P/tQ5lGkKwJsWvO/sMeoPj3x6VvypV8hJKvryOBGL8a0lW
         /cS9srs6F01eyi5QC61NcZGT/exHneWVXsX7w5e6P26ILqTGSDm13kH4X5PzYyJ2FS0G
         y67cX9kfAkE0CXaPVGSQDmTIDy42VA48Pg1yxTXzt6PvEQQ4uGsfiI27Or4kCGqFhuOi
         J9Eg==
X-Gm-Message-State: AOJu0Yze38uxhR/90N/7eDcXGvxNb/tusijqGaIPCJf6nWdR1GYf5a75
	4Td9U7xkbCcX9AuBUyV8hzPXvDe8F6R1q1W3gK2ii23G3lXV1UOmVTRr7A==
X-Google-Smtp-Source: AGHT+IFJ7OJnaAFnj8B2ZOT6bdj37w9PRjfK4PLk3JUkWp+aTlu3r5UEUBP46167mUeiyZN231OK7Q==
X-Received: by 2002:a17:90a:2dcc:b0:2e2:e597:6cdc with SMTP id 98e67ed59e1d1-2e2f0b01eb9mr14499191a91.22.1728958493245;
        Mon, 14 Oct 2024 19:14:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392f755a5sm268867a91.57.2024.10.14.19.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 19:14:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Oct 2024 19:14:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH} hwmon: (jc42) Properly detect TSE2004-compliant devices
 again
Message-ID: <62849805-9cea-47d2-bb3f-d7af8f08f910@roeck-us.net>
References: <20241014220426.0c8f4d9c@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014220426.0c8f4d9c@endymion.delvare>

On Mon, Oct 14, 2024 at 10:04:26PM +0200, Jean Delvare wrote:
> Commit b3e992f69c23 ("hwmon: (jc42)  Strengthen detect function")
> attempted to make the detect function more robust for
> TSE2004-compliant devices by checking capability bits which, according
> to the JEDEC 21-C specification, should always be set. Unfortunately,
> not all real-world implementations fully adhere to this specification,
> so this change caused a regression.
> 
> Stop testing bit 7 (EVSD) of the Capabilities register, as it was
> found to be 0 on one real-world device.
> 
> Also stop testing bits 0 (EVENT) and 2 (RANGE) as vendor datasheets
> (Renesas TSE2004GB2B0, ST STTS2004) suggest that they may not always
> be set either.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Message-ID: <20241014141204.026f4641@endymion.delvare>
> Fixes: b3e992f69c23 ("hwmon: (jc42)  Strengthen detect function")

Applied.

Thanks!

Guenter
