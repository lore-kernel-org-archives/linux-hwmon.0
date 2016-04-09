Return-path: <lm-sensors-bounces@lm-sensors.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	lm-sensors@lm-sensors.org, linux-hwmon@vger.kernel.org
References: <1453860229-23614-1-git-send-email-patchwork@patchwork.roeck-us.net>
	<loom.20160409T113101-533@post.gmane.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57091AAF.7030900@roeck-us.net>
Date: Sat, 9 Apr 2016 08:07:27 -0700
MIME-Version: 1.0
In-Reply-To: <loom.20160409T113101-533@post.gmane.org>
Subject: Re: [lm-sensors] [PATCH v3 00/25] hwmon: (it87) Various
 enhancements and fixes
List-Unsubscribe: <http://lists.lm-sensors.org/mailman/options/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=unsubscribe>
List-Archive: <http://lists.lm-sensors.org/pipermail/lm-sensors/>
List-Post: <mailto:lm-sensors@lm-sensors.org>
List-Help: <mailto:lm-sensors-request@lm-sensors.org?subject=help>
List-Subscribe: <http://lists.lm-sensors.org/mailman/listinfo/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: lm-sensors-bounces@lm-sensors.org
Errors-To: lm-sensors-bounces@lm-sensors.org
List-ID: <linux-hwmon@vger.kernel.org>

Hi Martin,

On 04/09/2016 02:33 AM, Martin Blumenstingl wrote:
> Guenter Roeck <patchwork <at> patchwork.roeck-us.net> writes:
>> From: Guenter Roeck <linux <at> roeck-us.net>
>>
>> This patch series builds on top of v4.5-rc1. The series was tested on
>> a system with IT8728F. Out-of-kernel versions were tested by various
>> people using a github repository.
> I've been running the whole series on top of v4.5 for the past two
> weeks on a system with IT8628E. I did not find any problems so far.
>

thanks a lot for the feedback. It would be great if you can send me
an official Tested-by: that I can add into the series (or a permission
to do so).

With the experience gained with the off-list driver, I think this series
is good to go for upstream, even without code review feedback. Otherwise
I fear we'll never get there. Jean, any objections ?

Thanks,
Guenter


_______________________________________________
lm-sensors mailing list
lm-sensors@lm-sensors.org
http://lists.lm-sensors.org/mailman/listinfo/lm-sensors
