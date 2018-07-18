Return-Path: <davem@davemloft.net>
Return-path: <davem@davemloft.net>
Date: Wed, 18 Jul 2018 10:02:52 +0900 (KST)
Message-Id: <20180718.100252.2181357683989452060.davem@davemloft.net>
To: andrew@lunn.ch
Cc: linux@roeck-us.net, netdev@vger.kernel.org, f.fainelli@gmail.com,
 rmk+kernel@arm.linux.org.uk, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH net-next 0/4] HWMON support for SFP modules
From: David Miller <davem@davemloft.net>
In-Reply-To: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
References: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 17 Jul 2018 21:48:09 +0200

> This patchset adds HWMON support to SFP modules. The two patches add
> some attributes for temperature and power sensors which are currently
> missing from the hwmon core. The third patch adds a helper for
> filtering out characters in hwmon names which are invalid. The last
> patch then extends the core SFP code to export the sensors found in
> SFP modules.
> 
> This code has been tested with two SFP modules:
> 
> module OEM SFP-7000-85 rev 11.0 sn M1512220075 dc 160221
> module FINISAR CORP. FTLF8524E2GNL rev A sn PW40MNN dc 160725
> 
> The anonymous module uses external calibration, while the FINISAR uses
> internal calibration. Thus both code paths have been tested.
> 
> Due to the cross subsystem nature of these patches, as discussed with
> the RFC, it is hoped Guenter Roeck will ACK the patches, and then Dave
> Miller will merge them all via net-next.

Series applied, thanks Andrew.
