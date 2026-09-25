Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1984D98E9
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353684; cv=none; b=tmh6I4I/ENG//EQnhggeOZpFcEe4DiLca6UMgJIsLgBnYv7TRuyV9uLqqxPVI15Wv68pdScuLDh7Yn0RpiCF3At50Xy2ZqHsHEb9MPX//IHcSDneV7Keb12gP0sQq0DdueNr1mu92wFEdSagX7fM6lbsulMLj5JfEq3NBJhaw+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353684; c=relaxed/simple;
	bh=Zx04GRhESpJuwUwQXfmh4GagFMWyql4BZ0xKHRNyTGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke8EZPHtz5rPfiOjrYyEPloJMsA65uNbRYIIJJhipppVuSSo5pdb98oKVBe2TGy2nEuchSZIxQ22cZY0y4ZoVQM8BkJzdRtANQRJeMpd8UJYHblnTKr75/NmWgDjk4vFhNdsEiquXlhSBsP+hMBhg+GMdP1b1sohEhxceXa4L3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLgFEotP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLgFEotP"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so658601a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353682; x=1790958482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=bLgFEotPQaJQDLcG26mkDYsRyezk4a7D18Be51OK2rd8p6pgtyzAO6g5OcOBHmZ4LA
         B91ZF41fjK+Pb0bNegb4F2d8trww0Sh0Ji2z4e9nNnBlyM2ffuoXpQ7b0EEaTngjyl6+
         paNx20v27X6qtkeg7yJ7/sqMjIu6tCMa/ZjP07FE4MJpmTfHPZ0ylWQk1MoOA/i6CYGy
         DoFDc2da6eykpCPMzQLM9rOBsy4bME7Bt29bchbCNcDdy+0E5bUma2HqHXbquKWaJhSi
         GzA4Z8fU5hNMtsiFDBmUnB4XCGPhDvLcFCqpOINWH4z78naRWINxnHMFFNYt+6y6LayD
         2vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353682; x=1790958482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=hvsDdcfoio6XwNqZIZWZZP0ZAAEAj8VLR88jn7zQ4tkBIKFi0yfhT1XUI5hWLSUO2D
         eqzqIPEj0oTz5W0lujax58CaS8u810WK1CDDYnoriqs8SAujVsLETT2k4YW/3L5RlP/m
         pGYqjjrSWdZ/YRLskwTtR5i56tUKzpdzCPB+/hfSyR2TYJ7mZtbCPWmkrhBk8Oj7oVnZ
         KQZ1XZx13uFFjUBXgtb73YHgm0wE3SnneHeAxZijcreMiOCIbTqCocX3Wb96tgWUG3nx
         q6p9buSIcoKjaKtUpqxIE7njclz4UTSTAW8qwE+1BnRklioqinxd6jwwABE3U3jzSio7
         66oA==
X-Forwarded-Encrypted: i=1; AKwUvBx+12mpwLNy6F/UTtHJk6LD1WWm+bHj/fSCWMxQ9HAVo0CwaiOVgu63DBx2pHaigelYQsJWQRQHkx/34g==@vger.kernel.org
X-Gm-Message-State: AFuF++ngmPNhIHVZ1Ee1HIc3kmwk3rDj4ylyz1lN6v+3KEWakNuGzEg3
	NNMDga/kkuHk3G9XD9JWoBvqrfWWSq28pCNuJ62KWZfNEzls6RrTWyu8
X-Gm-Gg: AYBFou1jUxyqVn9hEt5SUKORQt3kQS5LXQMbqM0m41/AbH7g+BTBjfuNq1/d5Ru5JsZ
	JuO9L3TKSlSNRmg7kNroGGZvpeW1gNIao9xWZ+u0TWW/zOH5NuyVbbAt4ydxrxMSokCzgc/PHVx
	GFmtNq8gH2zUask4iq5vkzT6OscmWUD0ZWMq1fQRcly0OAv34bt9In7P65D7HOeBKXsewNhVf3f
	tSjK0rojQuwSGW3D3y7RMMenyEY43jHbxWSMKTniEyWeh/DVKJ7niYYLJFKDM0JipivaPMpgQSh
	+N9fudGvOsn+JLo7gQ268pVA30XymJt9lLeLYXHvZhJXCZnkayLKVSu5uleJwkvPdbzzMWNvBhC
	igzeHrS4OL+W+MfC8z23x87lKHGLHBU+tata5066dOjOvQn2LfLPksfxxjvJ8CWyyezPyg0fgQd
	PBm7vBu8WauO2lrnY5qOpz9Ibn/akL/DELM/GIn1JFLgCoAA4/wqO3+FdpH/YKcOotVVLLA4E7Z
	SDaCEz8ZPzq
X-Received: by 2002:a17:90a:1c89:b0:3a0:9dbd:431a with SMTP id 98e67ed59e1d1-3a09dbd4752mr3475490a91.10.1790353681688;
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm12819580a91.4.2026.09.25.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 09:28:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Message-ID: <fd18f46f-deec-42ee-9574-91c71cc4caa1@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:35PM +0800, Colin Huang wrote:
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
> 
> They are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
