Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch [IPv6:2a00:d70:0:e::317])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80750198D;
	Fri, 24 Nov 2023 14:09:41 -0800 (PST)
Received: from [10.0.2.45] (helo=asmtp012.mail.hostpoint.ch)
	by mxout017.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1r6eMf-0008gT-0F;
	Fri, 24 Nov 2023 23:09:33 +0100
Received: from [178.197.218.170] (helo=thinkpad)
	by asmtp012.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1r6eMe-000J7e-2h;
	Fri, 24 Nov 2023 23:09:33 +0100
X-Authenticated-Sender-Id: code@stefan-gloor.ch
Date: Fri, 24 Nov 2023 23:09:31 +0100
From: Stefan Gloor <code@stefan-gloor.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sht3x: read out sensor serial number
Message-ID: <20231124220541.gvyaf7cbtc3kbesr@thinkpad>
References: <20231124145519.11599-2-code@stefan-gloor.ch>
 <52909c46-4699-442b-9303-ec914fba093b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52909c46-4699-442b-9303-ec914fba093b@roeck-us.net>
X-Vs-State: 0

Hi Guenter,

thank you for your comments.

On Fri, Nov 24, 2023 at 09:34:48AM -0800, Guenter Roeck wrote:
> I am not going to accept this as sysfs attribute. Please implement
> using debugfs.
> 
I will do this in V2.

> 
> Also, the attribute (sysfs or debugfs) should not exist if not supported.
> Please only provide if supported.
The driver is currently only compatible with "sht3x" and "sts3x". 
As only a subset of these support this feature, do you recommend I
create new additional device IDs, i.e., sts32, sts33 and sht33?

Best,
Stefan
-- 
