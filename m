Return-path: <jdelvare@suse.de>
Date: Mon, 29 Aug 2016 18:05:39 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Kapshuk <alexander.kapshuk@gmail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [v4.7.2: Oops] When loading IT87 HARDWARE MONITORING DRIVER
Message-ID: <20160829180539.687744a8@endymion>
In-Reply-To: <ea52f8e5-7dad-45f6-c1e8-6a1c1b787261@roeck-us.net>
References: <CAJ1xhMXZNMYMew4N2SZdhJm9FaiRjr=T63+72UdYpYfC+api_A@mail.gmail.com>
	<20160829120634.039204a6@endymion>
	<20160829121140.38c10554@endymion>
	<ea52f8e5-7dad-45f6-c1e8-6a1c1b787261@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, 29 Aug 2016 07:46:36 -0700, Guenter Roeck wrote:
> On 08/29/2016 03:11 AM, Jean Delvare wrote:
> > On Mon, 29 Aug 2016 12:06:34 +0200, Jean Delvare wrote:
> >> I'm trying to find when the bug was introduced. I have a hard time
> >> believing it went unnoticed for long. If it fixes your problem I'll
> >> send a clean patch.
> >
> > Broken by:
> >
> > commit 52929715634ad36782bd7018ab0bf59a6619c393
> > Author: Guenter Roeck <linux@roeck-us.net>
> > Date:   Sat Mar 30 14:00:08 2013 -0700
> >
> >     hwmon: (it87) Use is_visible for voltage sensors
> >
> Yes. Oops, I should know better. Thanks for picking this up so quickly.

You're welcome. This is my punishment for not reviewing the patches as
you post them...

-- 
Jean Delvare
SUSE L3 Support
