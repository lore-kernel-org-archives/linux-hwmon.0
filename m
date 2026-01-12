Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C51A334685
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252883; cv=none; b=VSi6sgkgEm992av6NPfrUYgVL66LX6+vVTdK/TRQ9tSH6KV+Jol/IX/LojyU3eIgW8mBOI9JJo06lM/FBioVFJcnDxe6v1HyX2S58L3TRotkbgqW0K2fM7lLikTFT0zio7Pl9UF+x4M/3KmwCJKgRB9BHK0KXD53d4jeBxjp1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252883; c=relaxed/simple;
	bh=usqYprYZmV8h73vHjEKetzQYo6Ml4Tr5aaTKpJSw6mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJujb8rWeMxah+eTfYljlvu1B+MtsTJQvBJf03UIOeWXBt3TW2Lo8eWlEN/883+Mfk/xkxVxuTp5M6vCxqE8Wv22Lfs+xtUkVWw3PO8zqlQguMUUh6UltSZKPlyqL2QoTAhm2E9pMCafdcEAw7kncP1/4+p2kNFJtFlckKZb7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcCQEU3L; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcCQEU3L"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-121b14efeb8so1914932c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768252881; x=1768857681; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWB3o7iYCg3rBT+LMFxCNWQPTyujG68ZxMLLHDTmtg4=;
        b=AcCQEU3L1eYlhrlLWpHZYl74714hDd5OgCTu5J58Jy0kcDOKIDMhQJ+YqrrrRWYdEL
         4YA8anRR1bi8d8G0w7uK2iNaplYZ+/3yNI4xWRiMwK1NlvLBAF+CN7d7dlGjzw3R4SkB
         C+WjJKxVxdLGYuYQ5NJ1dElRikOFklU7j2DaviX6IQkCGRDvW6j6tdtrtLI1yqm/MDNW
         OwHB+wPTWarzLWKKf7dEWb5x6LfPA3VYA0hyhosV4IRmR0nJK7k/jkjEr3pf5i4DxW28
         MKmMq70sq1O9s92VTZq7SxLRjO244RygeY+Tc6WQJpeouCDhTIIZqJtbwh4UDLJqK5UA
         pMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768252881; x=1768857681;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWB3o7iYCg3rBT+LMFxCNWQPTyujG68ZxMLLHDTmtg4=;
        b=MTZOf8GBIUgc9iEE0sfMkZJe3mAlXwtPeDlO6aPPNHrEGT6GBGWstymCuj6gyhl9oW
         LcsjfeiexjlyJzvdFwvikW8BFv5UjYfGtAwRSWfCRE0S/kG0xk6r3Ir5z031HVfMsq1U
         0xU8DaAAkWUMztaR2aFMwiv3pwUtuscIVjkQG0mh2Wh12YqNTwnl8uXwbC/Hk4d1AG/F
         5aYserO1X5vNsiTuGVDroNm3KpBYnwchDP/j9sLPEE7TqdOGis0RT24FRkgve2yH6/0m
         wkdu/fc4bQyqqmzhZy42X9vNZckaQQ59dPPFhUqZNU0HKhG2wdqfgzWxWe1ItyqAnOLv
         Irsg==
X-Forwarded-Encrypted: i=1; AJvYcCW4NZxiOhyPqELRpOjc9Gb3GySicNPBoWFCwXemuaEN06DvfoT4wvuuSyAVHueWtVGKrz97dcsdTjT9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzprtKqQBcpCcDEjZMINkC1qN40XGzjytLBpFi4lKvjFfqk/niF
	wQCNM6j1l20cQX4wbzkmm669hkAkcJnLjmOZ1Er0tOJUeZuQI10ky9PEWupDoA==
X-Gm-Gg: AY/fxX4f3T05rBXf6I8PdJcnSCGtLy8yLkEYdIu6b9G9RCN4t2rG4/23WknEF+/FLHi
	2Dcf+Gr4Gaks/JL5sbbGuAzi4aPDP4N5bXxR5/rKklxuwPpHy7qfG6wArkSBUTUz+jc2KGLyp16
	A86zUCEAY6/Ons9ndIHoJu6NMdCoelR9yRzpv6HfhLF0FvJL09zakN2rwbszNJKsfhLsP7WjMQ2
	w6pQ559k7H9bc8etR+RzdqvgwrP4b8WW9qPTEOViEQYCFRwOUW5FQp3ezelf8KvEpeB6UWwN2ry
	I0eoHj5KQI9wOnjuwPLtWnE5U1LgAUX1WZ7ShXDCTFxnmaMkNOc96fMNNt3066IHtUCo/iXIKpB
	T6bFhnbKP9YJ7yNftsmdMX2ihxMf8HAVl1GCzzHdIKuUeianAHUxVWzXrZWID8QYZfakI2Uy0L1
	OCcXeTXTMdgYHU2/OBTKZOcX+Y
X-Google-Smtp-Source: AGHT+IHfVFhCgnk7yB3/4W+B/gpmsGsEpe/7AR8eQcI1SfpYwlY37xUn9PEL4qCHJ4i3txQCRgnj6w==
X-Received: by 2002:a05:7022:4383:b0:11b:b179:6e17 with SMTP id a92af1059eb24-121f8b6781cmr18155726c88.34.1768252880923;
        Mon, 12 Jan 2026 13:21:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm25902300c88.11.2026.01.12.13.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:21:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:21:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add support for Dell OptiPlex 7080
Message-ID: <7bc197ec-9fb9-451b-b7b1-977d6d4c6152@roeck-us.net>
References: <20260104000654.6406-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260104000654.6406-1-W_Armin@gmx.de>

On Sun, Jan 04, 2026 at 01:06:10AM +0100, Armin Wolf wrote:
> The Dell OptiPlex 7080 supports the legacy SMM interface for reading
> sensors and performing fan control. Whitelist this machine so that
> this driver loads automatically.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/16
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
