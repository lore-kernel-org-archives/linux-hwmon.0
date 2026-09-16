Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF5235C687
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570681; cv=none; b=TXceBISqvfaWAecKUIqo9V+frNi/7PrLgIH/b/RlcTd64wpQ8jeeU91jrsMyyykkqgwxZvnw+sH7B8UqZ+AhW6Uq1bmcz+wSKsTy127/BuuaNY7R3dh/Y5rM0mGjQPX8iXPLaRaEEksUuSbnwqQeJCm2xgIgov/odjWY/3Ekf40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570681; c=relaxed/simple;
	bh=CpUAebJC1PrDhh1drx0A8Kt+YRnUWsUNY74Vdvutk7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsaeaDpAJX+8XqKHCYMfq+z+8C72Ms90GaBPwsCoysaU0CohW/E1UBy6C4N5RXjJPmksWswjBZcjySy2O86FtUwmXzvOPCIpCV6lThLlyulOHakZW9ZuLCW71oiVa4YQrhrMfKNdpFUSOCu2NKRPRzLnIKvCCOedFelz040wbu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaaMOHDP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaaMOHDP"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so946563a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570679; x=1790175479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TDixk/GSJOV5BpgRul+d6xvI1z7V0gQyg9KKI9YySso=;
        b=kaaMOHDP5rLcnaLL4AIPDb21bt0YbuZKDMUPF9Aa/w2agQsxv/vB2fFtbvsi1ZWKfV
         n1edh82X/Ejcs5n2CdQZG05c0IKRBNTxUUEW1xNuT1ryaqTCTuEHTP+NGsWmMsWqX41r
         5+F/JduHk5NdqnfzjQ+kB0SnSfu7gGbiq8X3cPDibdcpQLdGGI1dNP9Xm94LTjVjZ8qB
         Av27R6nORR6fUvDallFWH+7X9Rd+Y6NVjizjw2ULZ3bVjfv9BE86U8iMzwA4lGXcomO1
         yxw4E+mIGy8RD7CBk7qq8jNf7HdWO0vVTMEA2tfkudXGua4oSmlPO/pKdSJJW9k5HlK4
         qI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570679; x=1790175479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDixk/GSJOV5BpgRul+d6xvI1z7V0gQyg9KKI9YySso=;
        b=dlJAdtum/v/sh7DIRCTlOxNWm3nxKxz3XW2JnmwK6pwo3SGtBzO2lUh0NzcdLgo4mv
         9uaXy0+So/cuNAGEWhlvvEqpm5dsxhb0lLF9ambWl9RokyKes08MrFpiUUO1UbqG8G5m
         Z4LruginjRFRqZgiuywkccz9D1ijzE6TNywrNBxfGWqND5ldetHgQeaKd2FbHf/CxZIN
         Mi2PStWaYpdaDLhiC8N+Z5LDPdWducm1GUIrkVQ16Ewp5gMMCBGCVCKSKwyUHaSMnjKD
         QG1Jo2ZLIesMnPgwS/QzcGgq4zkEhxfxR9KILqRaSmw2wV97PzzhZGjcHPV7UJ54aw5Y
         N8dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj6wwJ9iysAgyM9f6/Q1GVucl+ffLlvfvfoK/Ui2onrH9DjacefBnmou8ChjwfqHjTjNQ/aLcTy+GWmA==@vger.kernel.org
X-Gm-Message-State: AFuF++lgsavLdJjn3PWdYCJsIp7yrOBxJFT0/Q0up+2MFmAXMGXSr3F9
	+D3zCiDJmgubijMgyHN2b1yt8QsKQLaQUoTad70MKIyqhFG0bgadT4ys
X-Gm-Gg: AYBFou1bNz9sOEjuvrSTYgxFX3+/H/tfQsuAId9rkIqQBqYPtUG9O5al9ddD4y8vR7K
	8jjpJgNOSUCvXLgB2paj2vI0XmWmjb/tNCaWGqY1qUHcumvCeIp1YFqPdvHoEFpx2CAfMuw40H4
	9AqayMCpqhSQMzXGhNEwKcbiK5oS26WsaXyXtXUKvzIj3CUJq3OcY+huuiV+ShxMFR9CYeJxaQv
	7MllnUYRzJWW6mD1XLc8j6X39/LByxVnF1kgGQAfN/dTPiYxo/N8/6QN7XGdWhqR/ydB17Z3nma
	cKR7aHB5eL5bAso9HW8tyTwYTxOyO2Gj7IaFtb7PrwOYkcyfmcFAuvGzXde93M39dYFKc67PJRv
	bTpl5JRK+65H9ARtqrOzkeIfjNHN4sP2bZs8ZMFTRHzbO8HjVuBdXPhrm3/y2Q4JE/GVjJH3wNf
	0uyZlRKMC19H2aqc3YrkOtSe1yxRDwuIS/eWzP1cSuR1ICUInk3qUtLaeoUkCGnBWh4lHiYBxnZ
	C0qIp0ynula
X-Received: by 2002:a17:90b:1c87:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e1e51d7dfmr6871687a91.23.1789570679120;
        Wed, 16 Sep 2026 07:57:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1d0be48csm1593063a91.3.2026.09.16.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:57:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:57:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Message-ID: <8a7d2481-16af-4fad-8eb8-00718117d354@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-3-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:41PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS536C7 is a PMBus-compliant dual-channel D-CAP+ multiphase step-down
> controller. Add its compatible string.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
