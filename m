Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8D39A7F6
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 21:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767492; cv=none; b=HVIBTgJrW2Beo6EwI6oDGefDpK6CiunGcVofYpnMWkEKpQJYZb9ZAxReo8KBOveL0dxpKgpEkWKTjf/zIKzH4wTWzcQXACW2+Eq+tAeWEfoWNNDturnapqAG1HczdqMS0FMApUQ0EJr0egcqpK3DtmnBJ5bDicC+EY5uNQSysOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767492; c=relaxed/simple;
	bh=cUOFFUEPGUl6/0IoSS/webMA+stfnfYvtBJgxAPcIFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhWUqqP5Pg/KnGq+v5rwjXaq7AjUCnHIFrTlwF3IJiPtMQHLI3ntLDcUEzvZfIOC6CY6uMbfQ+sbCNCpQZZLp1DKEbp1p/1o4WABQv9kTM/2DtrlW34kr4W/IZSbN+QbBh8kVQdcHsXdeRkcPByX1mLjLtQm5ZiTTlhGBzjbkoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9GNDAfM; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9GNDAfM"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30ec1ddd510so2158451eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 14:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782767479; x=1783372279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kxSpolFBpZ3ZN9a09p1x35bRlHFyG6e6uPx1x5cjXY=;
        b=Y9GNDAfMegdwMn0qhGuuHCIeyuZaU0VCVccpjzYHrN6u7zpgBvVvHdHCBHWepg6eOU
         aLZ8yXkKXdeqpPKAPUnKFD5r988hMRQ6+BOuY9yeUD23OWdk3jPNYROaWhJaOcb6WYQt
         R8y2ccFN4yBSbk+xJMcePAV2bJQzuG2h19cH5Zki43d+4YQRApQPVqUXx5ng/TIyOlEK
         uscYjK/G4j9YgLfiu+l7khKfVAduxF2FTWJx73nk4Xnwvnp//sfz1WNLWTAv5Jp14Ydw
         xBEWm6/d+FtpQOc8YftqC429DVXZ6R4S2pS1D6X6Ucp/HsmSaUh6Aj8PdRwhd6odT+q+
         5zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782767479; x=1783372279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7kxSpolFBpZ3ZN9a09p1x35bRlHFyG6e6uPx1x5cjXY=;
        b=N/PLx5iZVLFcxk7mlIDFXpxwYZxHxBTS5CdzV6S8H0cYZNaNeYW5FT4Tw9d/R1OgkV
         /Jx9PtQdUuWGJPJDB+lLx8mPkngGmShZ3B6qf2jvr5fVibS8QZScLfDW4kLwRunkrJtN
         F4Kq6BtXuU+EBnA78ML/GN9yEZWYKE6qV6ygkPQYUsIo1m0ore8fQH5e5wcKj7AtNyt4
         cMkDUuFKR78XiqvuVz69f/n8HXcPMKRBxKlY+J3OEPVGOe2J6BOLc7YXkcFeVEZRPwZz
         a16JOJj4kDbWp/1u8PzjjNwItMKQ+WrfDJPcPkLJHeIaMY40+3LRDY7N+Ze0c4K81IaH
         dULg==
X-Forwarded-Encrypted: i=1; AHgh+RqhoW6rs3vv4uZ/o8ahnBFVqnPHMotGGJ0UHGWk49QE600TlpEReHkHUa1QR9fTm4drpIiPB4YSSMqQSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7D55WGvhvCP2T/uTZ+8sdZ5X2SIfZwhS6pjN0kSCtKSMeXI8i
	35Vs2mz573CCoQvWnSfax0VZMvN+eal8phR2Qfnha4CujHfwsC7jmCV7
X-Gm-Gg: AfdE7cnXpAi3SqyH0y++6HXKE6j1mNkFO8XVetRoOUa3hS1UA7M3QxBjNXCNzw4akvK
	3EabL9GFEIqph2+iTlGI0EbPD1YdrUTsIkoiCY7MdYVv4VY17tuqceJt8owNJoSOxPTjE0K/xc2
	a0qoxzk/v19A39JGrAVe6EKbKhmgESTwr3qd4pZIwM7BiTUDcE/inGkWPqYH7Vl5iFr4ElABv7J
	sdR0TaODcwuGnzEFsZl4kkT5RT4br6yVBQTPrkUkq9hHC0dkhf/JTEmSfXYFKqMSOm0zEEJvvHS
	cFlTw2JTBxyPCc6gt/2cgfxhQPS6WKXecI/veuI0SZuO2tHQMxPzlVT8mihhfu8AbIEw5Zf17XW
	F1XsBiLislbFSPDWbEDozVXWhhR8NsvGgwwVLbf4qc9YPjiBirxBeAjrHrLq7E8xV8pzlX2CpJG
	GI2huyO/hT4eFdo8ilJK8whnyRYg==
X-Received: by 2002:a05:7300:372b:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-30ee109911cmr709652eec.0.1782767479292;
        Mon, 29 Jun 2026 14:11:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm1175147eec.15.2026.06.29.14.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:11:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 14:11:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/6] hwmon: xgene: Stop writing PCC shared memory
 signature
Message-ID: <62b11d8d-353b-47ef-919b-7af6aa7488c5@roeck-us.net>
References: <20260627-acpi_pcc_signature-v1-0-c1b7268d4fdc@kernel.org>
 <20260627-acpi_pcc_signature-v1-2-c1b7268d4fdc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-acpi_pcc_signature-v1-2-c1b7268d4fdc@kernel.org>

On Sat, Jun 27, 2026 at 05:37:30PM +0100, Sudeep Holla wrote:
> ACPI specification defines the generic PCC shared memory signature as
> the PCC base signature ORed with the subspace ID.
> 
> ACPI 6.6 added clarification that the signature is populated by the
> platform and verified by OSPM.
> 
> The PCC mailbox controller now validates the signature when the channel
> is requested. Stop rewriting the signature before each command and
> leave the platform-populated value intact.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Applied.

Thanks,
Guenter
