Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60383 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750735AbdDLJ3F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2017 05:29:05 -0400
Date: Wed, 12 Apr 2017 11:28:50 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Tommi Rantala <tt.rantala@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
In-Reply-To: <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1704121124510.1874@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net> <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 12 Apr 2017, Tommi Rantala wrote:
> Resume-from-suspend stopped working in HP xw6600 in fedora kernel
> 4.10.8-200.fc25.x86_64, while it worked just fine in
> 4.9.9-200.fc25.x86_64.
> 
> When powering on the suspended PC, there is no video output, and to
> recover, I need to reset the machine.

Is there just no video output or is the machine completely frozen? If it's
not completely dead, then you might be able to ssh into it.

Thanks,

	tglx
