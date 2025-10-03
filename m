Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1C7227B94
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Oct 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759522584; cv=none; b=nzW8KK9Pc4SJWf/sEHna5KnmRuLPVKMBa15nxoHtVHmWhgy/aOKim9Fc4uPPrwj8DlhvRYTNcH/Z21jLFS4p/DTvQJTyzcCQBDHxV6s8IE0olbzQZxux9c0Knusp8DIhrNZ2VNzCJdsE2g8nu1WqFhUjyNjs30I8u6r6ug7wBPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759522584; c=relaxed/simple;
	bh=H82ORd8hr/qh+IsbcypMsoZeBRi/Ei/EMP00ecr4XwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfdRCR848nkas4i5pQ/JpH8SvAXXX5bvwoLNKF0GQPDGlcYbvgvbaUS5JwSc9RgfAqTDSlPcqQeCsrcTEl9PozFty1eOol/wwEJk3Dg3diGd65f3Pir2kHzlBdapZ8sgsWWRz6sIQiqG4ZWKbnnvyxkdDL9Kw5D3DNxfeny4KX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miWdq48k; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miWdq48k"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5579235200so1911370a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Oct 2025 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759522582; x=1760127382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT0KFxIL7C7pHlludN9kedxbqFYyuMwiQOZio+aHSVY=;
        b=miWdq48kMvzPahxv/2I2hwS+3cXcV+SF+Bomf6a8gOlTD+zgu6ilEVfoNVCGVi2nD3
         2p2ZgO7ycjamOk5PXY7hdGQRdQtDP8Ofcu3vrDn51LwCpKrn7/o5Vb7n5KTdTnRj9kKx
         fej2jM2TV5r8Fa4D1aKoLtz/oJGsLIWZQXVJ9ykUXch674ynz45yINW4nCMSrt9/T10a
         P0M9vtsf7F/wQfeiTCaiZj420i0m8mboazidaWkNRo0bv9F7KLtpjraADtg35MQLdhYa
         To3OCEBOSKJ5IOJroEprQQqyMbZInCahZTM+vnIdI7Y4xFO7h9joYmLmA5ZECJFTWNOp
         IwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759522582; x=1760127382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT0KFxIL7C7pHlludN9kedxbqFYyuMwiQOZio+aHSVY=;
        b=hQZgutRAuvykA23htTHG52ETODlfnGlgMx2zBEAcrTzkgw/Y99BXLHmXHijyVgyU00
         ng2TSCbw/3W3AS6bYBCnnm39TOF05kPrEcT8D03C4MX9k8rtOHXWeAmxL6qM+J3UjQ6e
         w3P8VYoKgnrEzUITUCn5Ca+ril5kAo0zZTsfof/ty4FHY+uzpto5Q8TuWYtLXQ54E35n
         NElOkMJ8UiErvBXdUi/EBOPnCp1uH1ymZlJ8Etidqi3uFxlE1OSwB83iZhqFk3CSOqg8
         nQ2Qak2H3VbbkZQnCvErJ3tbxibGb//JQ+5vUKbO+RKf1s81z1q0BqgPO49eWcGu8zDC
         ZdKA==
X-Forwarded-Encrypted: i=1; AJvYcCWVbBi7EJXLLhf2lZHUM9+/ZUl5+lhqYli7m3hs7bL5Df/lIgWUIrhHo8IAFvB1Iq+hnWYYViDaG1iDlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMpJBof7I+2s3kFaQIT0nSfB8DSfQAkdeYJFoJtbdh4Ih6bvE
	2ZpROlPlTuUFDxSgJqvlYpfzRcoTMRylpmzytFKtNDxwPXdG+ATcVvFXwAGoqxKh
X-Gm-Gg: ASbGncuaBk5q6KAPWpIhPRJH53lUeLPCQ38v/1Q1nwL3/JX3jjYrhTyS4zigy1UPgXF
	xIq0cxO33RU9Gl4VW9o3hlXyLm+BbTCapoi8XPcOpkJoK46YEHzyEm9/SRj5poxWA6IYEV/FeWb
	kdvgSU/P2OmQrYkYYcaqirGyb2j8cUGe1SGrnW074gZX/7oUKUkOEWzWghpvl+owskxc+AvfNXz
	8hpeLDajw6qUcc1TUmOhvAY6JtYgWWx2o0niKvoVYP0+IhQ3K1TqNpVkS6nk+9vJcWyQNSsyiMZ
	VkEZ7Hx9qo/rJq7jbp6WUsqzLiyUdv9FkdM+B+n4oMrRcTRxmYkxHOAM8eG72Yjm06qXJ3PFbih
	pEoTLLOaB+wat36Nz3LXoCPKflhmh8uM1s15SyPv9n3tsJjg4thZfu2bE8G4j7TYV0dgJTg==
X-Google-Smtp-Source: AGHT+IHlq2cs9sTsIIqnaPqXRQUWUxlWT7W2DP5KttS/b44KTLj0dCHGzWL4O7j4Y3l7/oRyurJF/w==
X-Received: by 2002:a17:902:f68c:b0:24a:d213:9e74 with SMTP id d9443c01a7336-28e9a634df9mr55325195ad.49.1759522581776;
        Fri, 03 Oct 2025 13:16:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110ceasm59027385ad.15.2025.10.03.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:16:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 3 Oct 2025 13:16:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Paul Heneghan <paul@networks-extra.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI
Message-ID: <7e34002d-4684-4eb8-9228-168f1b6987fd@roeck-us.net>
References: <20251003081002.1013313-1-eugene.shalygin@gmail.com>
 <20251003081002.1013313-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003081002.1013313-2-eugene.shalygin@gmail.com>

On Fri, Oct 03, 2025 at 10:07:56AM +0200, Eugene Shalygin wrote:
> From: Paul Heneghan <paul@networks-extra.com>
> 
> Added support for Pro WS TRX50-SAGE WIFI motherboard.
> 
> Signed-off-by: Paul Heneghan <paul@networks-extra.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
