#ifndef ENGINE_H_1D9Q0055
#define ENGINE_H_1D9Q0055

namespace Blast {
    class Engine {
	private:
		Engine();
		Engine(const Engine&);
		Engine& operator=(const Engine&);
    public:
        void test();

		static Engine& get() {
			static Engine engine;
			return engine;
		}
    };

	static Engine& engine() {
		return Engine::get();
	}
}

#endif /* end of include guard: ENGINE_H_1D9Q0055 */
