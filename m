Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E210572685
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883375; cv=none; b=aGuMFCR9HJOanoeby6+AG11HUrOd+boK00phlotGak+10DcVk2gw8u/1tBaEhGU8gv/xDG2Zf6cEDlu9ss1h5W8lMDFwySlsXq3RpLPgszIVqzk9Dmv+hCjiHpFlcly1k4b9t/YeCAiqd1ELf0DpEFcWw+kMd/iGNIVljz3EFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883375; c=relaxed/simple;
	bh=fowOda5nGupsFf01k/omN8c/riu+f+Ge/XDh5veNoF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdkq8DIB11cYqUAXW6dM0Nqk7Cp+mrQGP42Dhlrhj+9NFzc/6/U1IMWub96KTxxlUWgzW7WVe7zRqDN7NJTsiuSltCx0kQPPmf9zypTHXJMDQQYA3hpCc6yjO+AVKH6wl9yvyerLMq5vPEP7D02UESChIg8Ib0VfGDjnBoB0qJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrFHqBHG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrFHqBHG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so7510909a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883373; x=1789488173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eqXOidO4jwZuxgnfuLYDm8pckJde6bH8K5OH3Dd0Jl8=;
        b=LrFHqBHGZ5pOQIFSL8qXbLkGPsQOTVFWV9aRqebWXyIlvURfeZIofRtLcGGnvvm/me
         4ue49ADo+4+GU/+U0zglry8JEQvcPNRa+TNvP1/AyW7aVXZmuTmMDL/CS0+9GfMSJl+J
         EdhYpL/lPp/gjoH+Bd9kHPvBqbFTalsN+CrT/k6EO5B/S2fgfaIhjoQNpgFZ2kPHAMRY
         drJ+zX9v6V6gfDkZv3cKxhvHIKMNlZXxlaLM2no0Cysw0PXPmQ+6LfgflqhynIJss9fc
         Su7CHmpcETr/Br6grTe26ysFc2pmBt8RxFH8TNLik4srhFyhhLLbnjgJSRNnsKAJwGmH
         gslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883373; x=1789488173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqXOidO4jwZuxgnfuLYDm8pckJde6bH8K5OH3Dd0Jl8=;
        b=QGups+ZYuKMQm2mSWay+4Q0xIcoLwJfCD8+qY5eJiMYCoP6qany//aBLw+OK2g1KYt
         6vQ1olU8y4wJ0mp8eG0DU6d6fF8bp84hborFIlk+tITL9K2NZQ/JmOf9AmsngT3nPQ9+
         9/QCAgo4ko2ZMgEk/HmiBlaqvMt5hip5PfMm0hjIU8KB/4lP/xbVL4seHI3llwcF1O22
         pD/LLoo3oD0+TFKe99UQmnhyoEiimz+t4yfrhwY/lzEtrRNVX4SOqLPCY7+JSgUXakbV
         vjMDjL4GWtVgGgKmuDFglKtkM447kqrbewMsDPWNBTI14wqHSHNSsNxsLSJwRyQGhREt
         7NTA==
X-Forwarded-Encrypted: i=1; AKwUvBw8YqD7ng4DWm4BOHVMtH+KHrAaJbZ3R1G9Gjlo71CSJ8koUCdbxFo8M9Cuozo0wEekWkqvshyKWz9sLg==@vger.kernel.org
X-Gm-Message-State: AFuF++loH9apr6KNxMGHmAXVIW1WvIn59yvRfequPmbL0hPg6aubRnte
	R9P+isH8wOfzj32jgMXhqPoRX4MP1eoe6rtBHRqV0ShpJFbj2g3TspEp
X-Gm-Gg: AYBFou3NRttmqqaXiJuZ0cAV68Jb3gB4LM0Px17qK059j1a1HQCRRDKbsMcMPC/6PAm
	QvUZq6Mbtnv1gFw4HG71tBx3MjpQaEE4TcNQ2WHbhJ+0QTQCloxCry3Ap1H7rca8JF5gq9B63n/
	bVKCiD9cLtHqjSC+TcPvHX5ynjY1D4+T/sZz01s79e7nPuXyZNrkYwqOrZNtKs9nqCKnXtQwxcI
	Uj5g7mL7gCBliCz2OD/pkE4S4l72MVT0Zt73J/fDD/DwZkwigJUVzSBlJlYecVRth8BR5rGotzC
	coH7mhHF3j3SULavgG7thzJs0LQhNI0tJpDriBszp7bgBNbTd0G4zuHmrmAr5EwerUzFapl0Di5
	TWktDictWWjkMdb97hkiZ+C2wJT9F7gfVISohMEw0a02Wcn0gZrpJ51pC1gpICbNCnZY06eczaf
	gRe6bapI6po79wbWWEbA3nvrr6KwMAkclZ5wOnEKuKgYtiPAa5QDHUisEjz3DgTXeKjEwRxhNzA
	ziPMUuX8uOn
X-Received: by 2002:a17:90a:e703:b0:398:d843:cad9 with SMTP id 98e67ed59e1d1-39b26226de8mr46784266a91.19.1788883373211;
        Tue, 08 Sep 2026 09:02:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd15asm27266561a91.4.2026.09.08.09.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:02:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:02:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Steve Glendinning <steve.glendinning@shawell.net>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: fix typos in comments
Message-ID: <4dc6a708-f134-4a76-b363-1a0e405920b1@roeck-us.net>
References: <20260904114249.26515-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904114249.26515-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:12:46PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied.

Thanks,
Guenter
