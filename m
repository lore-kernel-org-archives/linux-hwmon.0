Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016A3438A2
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121032; cv=none; b=OzKQi6tV67kSpy5ufEGr0qwJ1VRNAqYArueTvlrhcKjCQOx8EbJu3dXZJa9gSwVj1dZdKbcL6Qgq6XCFn2ucyQiKWyeK8xHzhl6bXTnrffvez4LJceG7WgjI0ha9e+Rfia4xaRZxP7R+sr3qZp9+9BuLpLhvfu5IAeOV2Vbu3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121032; c=relaxed/simple;
	bh=NdoR2dUOz+cvRTVp6dzp5eO0K7yE82vTXhrdPrgb+7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0tVGtQdUSumjsu1kajSr78/gKTIb2kNw2P9VbeNWYHSSzuMhIHc/nGlcx+eu1+PxkEG0IGCoumqn3cvs2mg52eWxsmBs/ymz+/RCEZeLvbsJDz3gWEHQ/WjCqQvG+yvT0dt9hamRRlpyLE4nG6lb9TBGNWngkzaTBh3r5VNQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TquLqj9a; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TquLqj9a"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-306f36df4feso186959eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781121031; x=1781725831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AE+2DETC16XLEWZxUW4XVA4+dACVsOVOfwIUzPMRy7Q=;
        b=TquLqj9a3Y8qCGW+oxPw2IUauU6GdiR+/BPbr7wSa9q18MaQL0XoM0NQCVP6KcU1W2
         GqthVJz299q23fApFLZGeLXpgl+e6oO/dWpo5j4LE4HbQaXkN0dp40I4RYSHbbZmDpwK
         GlP+BPCuEjG5rTOt0iAt/nz9PKy3bEGTLQVfNALxqYB8YrBaqyhW97H1mCE1TdILEXbN
         /Y4lhOoG0eZn25sR8iIexmP+xHDfgjoXTmNYanDsnNEQUzHT0dBjMUfgfOOHPtcMmVcI
         lnnsQTJAALFxqyaDGbpUf7wSz2/KOM0z/jnsoeRapHA/XU/j+/9NtkAccMBiP8fvN/iF
         MOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781121031; x=1781725831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AE+2DETC16XLEWZxUW4XVA4+dACVsOVOfwIUzPMRy7Q=;
        b=ebNqfGpPXHWOMJ9sQPFsxCCeA+eLlf3/kR4WyhF9jBpajRcpPPGTJlV33/NOtP5eZP
         ubaq7AboWfL8wK2lo+bpcZzUfyVbT8bHgy25l3Ch5X0kBlgVtEx5MnlrbD3gr17OMJll
         MKNN2GSgxIak0LBS5UNgwFfZ4ODnK71F7vSxaSV52maMgslAZCp/ToErQIOb/JY5nlvJ
         x0HHlHVMe1z1+uBs+/FOFkN8CBeUCigJB+TQsS38g1VtEhAJHttQBvpUuuUzAw2uVsZ5
         CaniahXg6s9M8xRnKyjaIW7iK4lkuL1Oqv+u9nU2q2yEifl8GmT2bQYVzAh/kWbhrHgc
         y+cA==
X-Forwarded-Encrypted: i=1; AFNElJ/lSxA6mydxExOxUPT1i/G5GygSr6yqXDa0LWqJOnI2oomOF9ItDoMZB0uOiJ9gnxMA63zfSMKZWkZJfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtnVYHz1bCWTxjXsiBMkKhhLlQRLZ7gKSByfmz993PXtubAxD
	d31xTlUdBxIkg3vSgZ2xiAL1ok8l4tbKZBj7lPFjENG3rJ2dzTXy071Z
X-Gm-Gg: Acq92OGZY9F38FIKzPtUeeC5fkD3jnoNVbSzkXqXYG+CYRQlBrmOBUde+S8dt00WVq+
	aZ0Oc3H9RAaTFENY4G+iVmolYUabmT9GqS55GyowZLQcznnq4lCFDcpYwfojiQA6GplbwZq/7sd
	1nAzNe6gHA19MbprKvBtIFIw500SsdeRUhQfwn2NR28TR9lSrT29YvwZLOwSh43m6kgyrdnaTUQ
	ye5ODD/dgFOLPZhcLht8GXdqVa4k9pst8wQ+FpzAwLSH/uU0xPKOrYRSN4EHI9GD46zXQfIfywm
	H7RJlYo+4t7czcWcNSpHj9XQRHdlifCJPWwvjEjt13Eswwf1mT6z7+FlvF0jDnefUhDQD0jjTv1
	7xMmdqGO/1gknJZldFdgBACsEU6vjSvFJq+TTGDa9DyJDFxeOD7YFoMTn++64xyhJ1o4jRyBxTK
	P5Tlk/Vj6AJYYp05Xco5+OhArpFilT4h9iJGQ/JZifXp8K/qk=
X-Received: by 2002:a05:7301:e0c1:b0:2d2:d5a3:e97c with SMTP id 5a478bee46e88-308015d8c77mr47705eec.12.1781121030827;
        Wed, 10 Jun 2026 12:50:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e76sm25662344eec.18.2026.06.10.12.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:50:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:50:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <2cc27856-725b-492e-bce9-f1208a89fd4c@roeck-us.net>
References: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
 <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>

On Wed, Jun 10, 2026 at 06:19:47PM +0300, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels,
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Applied.

Thanks,
Guenter
