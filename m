Return-path: <fedora@leemhuis.info>
From: Thorsten Leemhuis <fedora@leemhuis.info>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 Jan C Peters <jcpeters89@gmail.com>,
 =?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Tolga Cakir <cevelnet@gmail.com>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <2fc3a0a0-950d-845c-200d-7a89b57270f6@leemhuis.info>
Date: Thu, 26 May 2016 17:39:57 +0200
MIME-Version: 1.0
In-Reply-To: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Lo!

Pali Rohár wrote on 21.05.2016 16:46:
> […] Thorsten […] can you test this patch if it fixes your freeze problem at
> boottime and when using "sensors" program?

FWIW, I never saw either of those problems. I only saw the third issue
that was mentioned: the CPU fan speed is going up and down as described
in https://bugzilla.kernel.org/show_bug.cgi?id=100121

> I need to know if this patch fixes problem on Dell Studio XPS 8000 and
> Dell Studio XPS 8100 machines, so we can revert git commits:
> 6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8000")
> a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8100")

Just checked: Sorry, that patch did not fix the CPU fan speed issue on
my XPS 8000, so there is afaics no reason to revert 6220f4ebd7b4 :-/

HTH, CU, knurd
