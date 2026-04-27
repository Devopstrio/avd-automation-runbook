import React from 'react';

// Devopstrio AVD Automation Runbook
// Executive Command Center Dashboard

const Dashboard = () => {
    return (
        <div className="min-h-screen bg-slate-950 text-slate-200 font-sans selection:bg-indigo-500/30">
            {/* Enterprise Navigation */}
            <header className="border-b border-slate-900 bg-slate-950/80 backdrop-blur-md sticky top-0 z-50">
                <div className="max-w-screen-2xl mx-auto px-8 h-20 flex items-center justify-between">
                    <div className="flex items-center gap-6">
                        <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-indigo-600 to-violet-600 flex items-center justify-center font-black text-white shadow-[0_0_20px_rgba(79,70,229,0.4)] border border-indigo-400/20">
                            AV
                        </div>
                        <div>
                            <h1 className="text-xl font-black text-white tracking-tighter">AUTOMATION HUB</h1>
                            <p className="text-[10px] font-bold text-indigo-400 uppercase tracking-widest leading-none">AVD Operations Control</p>
                        </div>
                    </div>
                    <nav className="flex gap-8 text-xs font-bold uppercase tracking-widest text-slate-500">
                        <a href="#" className="text-indigo-400 border-b-2 border-indigo-500 pb-8 pt-8">Overview</a>
                        <a href="#" className="hover:text-slate-200 transition-colors pt-8 pb-8">Runbook Library</a>
                        <a href="#" className="hover:text-slate-200 transition-colors pt-8 pb-8">Host Pools</a>
                        <a href="#" className="hover:text-slate-200 transition-colors pt-8 pb-8">Incident Queue</a>
                        <a href="#" className="hover:text-slate-200 transition-colors pt-8 pb-8">Compliance</a>
                    </nav>
                </div>
            </header>

            <main className="max-w-screen-2xl mx-auto px-8 py-10">

                {/* Automation Scorecards */}
                <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-12">
                    {[
                        { title: 'Automation Jobs (30d)', value: '4,120', trend: '+12% efficiency', color: 'indigo' },
                        { title: 'Active Session Load', value: '1,840', trend: '72% Utilization', color: 'emerald' },
                        { title: 'Est. Cost Savings', value: '$24.5k', trend: 'Deallocation Logic', color: 'amber' },
                        { title: 'Platform Health', value: '99.9%', trend: 'No active drift', color: 'blue' }
                    ].map((kpi, idx) => (
                        <div key={idx} className="bg-slate-900 p-8 rounded-3xl border border-slate-800 shadow-xl relative overflow-hidden group hover:border-slate-700 transition-all">
                            <div className={`absolute -right-8 -top-8 w-32 h-32 bg-${kpi.color}-500/5 rounded-full blur-3xl group-hover:bg-${kpi.color}-500/10 transition-all`}></div>
                            <h4 className="text-[10px] font-bold text-slate-500 uppercase tracking-widest mb-3">{kpi.title}</h4>
                            <div className="text-4xl font-black text-white font-mono tracking-tight">{kpi.value}</div>
                            <div className={`text-[10px] text-${kpi.color}-400 font-black mt-3 bg-${kpi.color}-500/10 inline-block px-3 py-1 rounded-full border border-${kpi.color}-500/20`}>
                                {kpi.trend}
                            </div>
                        </div>
                    ))}
                </div>

                <div className="grid grid-cols-1 xl:grid-cols-3 gap-10">

                    {/* Live Execution Stream */}
                    <div className="xl:col-span-2 bg-slate-900 rounded-3xl border border-slate-800 p-8 shadow-2xl">
                        <div className="flex justify-between items-center mb-8">
                            <h2 className="text-lg font-black text-white uppercase tracking-wider flex items-center gap-3">
                                <span className="w-2 h-2 rounded-full bg-indigo-500 animate-pulse"></span>
                                Live Automation Stream
                            </h2>
                            <div className="flex gap-3">
                                <button className="bg-slate-800 hover:bg-slate-700 text-slate-200 text-[10px] font-bold uppercase tracking-widest px-4 py-2 rounded-lg border border-slate-700 transition-all">View All Jobs</button>
                                <button className="bg-indigo-600 hover:bg-indigo-500 text-white text-[10px] font-bold uppercase tracking-widest px-4 py-2 rounded-lg shadow-lg shadow-indigo-600/20 transition-all">Trigger New</button>
                            </div>
                        </div>

                        <div className="space-y-4">
                            {[
                                { job: 'Scale-Out Pool: UK-PROD', status: 'Running', progress: 65, type: 'Lifecycle', time: '2m ago' },
                                { job: 'Image Patch: Win11-Multi', status: 'Success', progress: 100, type: 'Maintenance', time: '14m ago' },
                                { job: 'Self-Healing: Stuck Session', status: 'Success', progress: 100, type: 'Incident', time: '1h ago' },
                                { job: 'Daily Cost Optimization', status: 'Success', progress: 100, type: 'Compliance', time: '4h ago' }
                            ].map((job, idx) => (
                                <div key={idx} className="bg-slate-950/50 p-5 rounded-2xl border border-slate-800 flex items-center justify-between group hover:border-indigo-500/30 transition-all">
                                    <div className="flex items-center gap-5">
                                        <div className={`w-12 h-12 rounded-xl flex items-center justify-center border ${job.status === 'Running' ? 'bg-indigo-500/10 border-indigo-500/30 text-indigo-400' : 'bg-slate-900 border-slate-800 text-slate-400'}`}>
                                            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M13 10V3L4 14h7v7l9-11h-7z" /></svg>
                                        </div>
                                        <div>
                                            <h3 className="font-bold text-slate-200 text-sm">{job.job}</h3>
                                            <div className="flex items-center gap-3 mt-1.5">
                                                <span className="text-[10px] font-bold text-slate-500 uppercase tracking-widest">{job.type}</span>
                                                <span className="text-[10px] text-slate-600 font-bold">•</span>
                                                <span className="text-[10px] text-slate-500 font-bold">{job.time}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="flex flex-col items-end gap-2">
                                        <div className={`text-[10px] font-black uppercase tracking-widest ${job.status === 'Running' ? 'text-indigo-400' : 'text-emerald-400'}`}>
                                            {job.status} {job.status === 'Running' ? `${job.progress}%` : ''}
                                        </div>
                                        {job.status === 'Running' && (
                                            <div className="w-32 bg-slate-800 h-1 rounded-full overflow-hidden">
                                                <div className="bg-indigo-500 h-full w-[65%] shadow-[0_0_8px_rgba(99,102,241,0.6)]"></div>
                                            </div>
                                        )}
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>

                    {/* Operational Insights Column */}
                    <div className="flex flex-col gap-8">

                        {/* Host Pool Health Map */}
                        <div className="bg-slate-900 rounded-3xl border border-slate-800 p-8 shadow-xl">
                            <h2 className="text-xs font-black text-slate-500 uppercase tracking-widest mb-6">Host Pool Topography</h2>
                            <ul className="space-y-6">
                                <li className="flex justify-between items-center">
                                    <div className="flex items-center gap-3">
                                        <div className="w-2 h-2 rounded-full bg-emerald-500 shadow-[0_0_10px_rgba(16,185,129,0.5)]"></div>
                                        <span className="text-sm font-bold text-slate-200">UK-SALES-POOL</span>
                                    </div>
                                    <span className="text-[10px] font-mono text-slate-400">142/150 ssn</span>
                                </li>
                                <li className="flex justify-between items-center">
                                    <div className="flex items-center gap-3">
                                        <div className="w-2 h-2 rounded-full bg-indigo-500 animate-pulse shadow-[0_0_10px_rgba(99,102,241,0.5)]"></div>
                                        <span className="text-sm font-bold text-slate-200">US-ENG-CLUSTER</span>
                                    </div>
                                    <span className="text-[10px] font-mono text-slate-400">Scaling Hub</span>
                                </li>
                                <li className="flex justify-between items-center opacity-50">
                                    <div className="flex items-center gap-3">
                                        <div className="w-2 h-2 rounded-full bg-slate-600"></div>
                                        <span className="text-sm font-bold text-slate-200">DEV-SANDBOX</span>
                                    </div>
                                    <span className="text-[10px] font-mono text-slate-400">Off-Schedule</span>
                                </li>
                            </ul>
                        </div>

                        {/* Recent Governance Incident */}
                        <div className="bg-gradient-to-br from-indigo-900/20 to-slate-900 rounded-3xl border border-indigo-500/20 p-8 shadow-xl relative overflow-hidden">
                            <div className="absolute top-0 right-0 w-32 h-32 bg-indigo-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2"></div>
                            <h2 className="text-xs font-black text-indigo-400 uppercase tracking-widest mb-3">Governance Alert</h2>
                            <p className="text-sm text-slate-300 font-medium leading-relaxed mb-6">
                                Compliance Engine detected 4 hosts in US-EAST without the mandatory 256-bit encryption tags. Auto-remediation is currently pending your approval.
                            </p>
                            <div className="flex gap-3">
                                <button className="flex-1 bg-indigo-600 hover:bg-indigo-500 text-white text-[10px] font-black uppercase tracking-widest py-3 rounded-xl shadow-lg shadow-indigo-600/20 transition-all">Approve Script</button>
                                <button className="flex-1 bg-slate-800 hover:bg-slate-700 text-slate-300 text-[10px] font-black uppercase tracking-widest py-3 rounded-xl border border-slate-700 transition-all">Ignore</button>
                            </div>
                        </div>

                    </div>
                </div>
            </main>
        </div>
    );
};

export default Dashboard;
